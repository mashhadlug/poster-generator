#!/usr/bin/env bash

set -euo pipefail

EVENT_TYPE="tech-event"
SPECIFIC_EVENT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --tech-event|--book-review)
            EVENT_TYPE="$1"
            shift
            ;;
        -h|--help)
            cat << EOF
Usage: $0 [OPTIONS] [EVENT_ID|FILE]

Generate event posters from template files.

Options:
    --tech-event, --book-review   Specify event type
    EVENT_ID                Numeric ID of event in events/ directory
    FILE                    Path to specific .vars file

Examples:
    $0 15                   # Build event 15 from events/15.vars
    $0 --bookreview event.vars # Build with specific type
    $0                      # Build all events

EOF
            exit 0
            ;;
        *)
            if [[ -f "$1" ]]; then
                SPECIFIC_EVENT="$1"
            elif [[ "$1" =~ ^[0-9]+$ ]]; then
                SPECIFIC_EVENT="events/$1.vars"
            else
                echo "Unknown argument: $1"
                exit 1
            fi
            shift
            ;;
    esac
done

build_poster() {
    EVENT_FILE=$1
    NUM=$(basename "$EVENT_FILE" .vars)

    echo "Building poster for event $NUM with type: ${EVENT_TYPE:---default}"

    set -a
    source "${EVENT_FILE}"
    set +a
    
    if [[ -n "$EVENT_TYPE" ]]; then
        export EVENT_TYPE="${EVENT_TYPE#--}"
    fi

    envsubst < ${EVENT_TYPE}.tex.tpl > out/${EVENT_TYPE}.tex

    if [[ -z "${EVENT_LOCATION_URL:-}" ]]; then
        echo -e "\033[31mEVENT_LOCATION_URL variable is empty in $EVENT_FILE."\
        "This field is required for qrcode generator.\033[0m"
        exit 1
    fi

    qrencode "${EVENT_LOCATION_URL}" -o assets/qrcode.png -s 10 --foreground=000000 --background=FFFFFF00

    xelatex -output-directory=out out/${EVENT_TYPE}.tex

    pdftoppm -png -rx 300 -ry 300 out/${EVENT_TYPE}.pdf -o ${EVENT_TYPE}
    mv ${EVENT_TYPE}-1.png "out/${EVENT_TYPE}-${NUM}.png"

    envsubst < "${EVENT_TYPE}.txt.tpl" | sed 's/\\lr{\([^}]*\)}/\1/g' | tee "out/${EVENT_TYPE}-${NUM}.txt"
}

mkdir -p out assets

if [[ -n "$SPECIFIC_EVENT" ]]; then
    if [[ ! -f "$SPECIFIC_EVENT" ]]; then
        echo "Event file not found: $SPECIFIC_EVENT"
        exit 1
    fi
    build_poster "$SPECIFIC_EVENT"
else
    for i in $(find events/ -type f -name '[0-9]*.vars' | sort); do
        build_poster "$i"
    done
fi

rm -rf out/{*.pdf,*.log,*.tex,*.aux} 2>/dev/null || true
