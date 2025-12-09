SHELL := bash
VIEWER = evince
EVENT_NUMBER =

all: build build-png textual-banner

out:
	mkdir out

build: cleanup out out/session.pdf

view:
	${VIEWER} out/*.pdf

qrcode: assets/qrcode.png

assets/qrcode.png:
	set -a; source events/${EVENT_NUMBER}.vars; set +a; echo $${EVENT_LOCATION_URL}; \
	qrencode $${EVENT_LOCATION_URL} -o assets/qrcode.png -s 10 --foreground=000000 --background=FFFFFF00

out/session.pdf: out/session.tex qrcode
	xelatex -output-directory=out out/session.tex

out/session.tex: session.tex.tpl
	set -a; source events/${EVENT_NUMBER}.vars; set +a; envsubst < $< > $@

build-png: out/session.pdf
	pdftoppm -png -rx 300 -ry 300 out/session.pdf -o session
	mv session-1.png out/session-${EVENT_NUMBER}.png

textual-banner: out/session.txt

out/session.txt: session.txt.tpl
	@set -a; source events/${EVENT_NUMBER}.vars; set +a; envsubst < $< | tee $@

cleanup:
	rm -rf out assets/qrcode.png
