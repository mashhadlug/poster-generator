این زیرپوشه پوستر هر رویداد را تولید می‌کند. کافیست در پوشه `events` یک فایل با فرمت `vars` ایجاد کرده و اطلاعات آن را پر کنید، سپس میتوانید تصویر پوستر
جلسه را با وارد کردن نام آن رویداد تولید کنید.

پیش از اجرای پروژه نیازمندی های آن را نصب کنید.

```bash
sudo apt install texlive texlive-xetex texlive-lang-other texlive-fonts-extra poppler-utils qrencode evince gettext
```

# مستند کوتاه طریقه ایجاد پست

این اسکریپت برای ساخت پوستر و متن دو نوع رویداد استفاده می‌شه:  

1. **نشست‌های معرفی کتاب** (`book-review`)  
2. **ارائه‌های فنی** (`tech-event`)  

---

## نمونه استفاده

### نشست کتاب
```bash
cp events/book-review.vars events/289.vars
./post-generator.sh 289
# or
./post-generator.sh events/289.vars
````

### ارائه فنی

```bash
cp events/tech-event.vars events/300.vars
./post-generator.sh 300
# or
./post-generator.sh events/300.vars
```

---

## خروجی

تمام فایل‌ها داخل پوشه `out/` ذخیره می‌شن:

* پوستر PNG: `out/<event_type>-<event-number>.png`
* متن رویداد: `out/<event_type>-<event-number>.txt`

**event_type** پیش‌فرض: `tech-event` برای ارائه فنی و `book-review` برای نشست کتاب

# تبدیل لینک مکان به OpenStreetMap

یه اسکریپت کوچیک که لینک مکان از سرویس‌های مختلف رو می‌گیره و به لینک OpenStreetMap تبدیل می‌کنه.

---

## چطوری اجراش کنم؟

```bash
./osm-generator.sh [LOCATION_URL]
```

`[LOCATION_URL]` می‌تونه لینک یکی از این سرویس‌ها باشه:

- `neshan.org`
- `google.com/maps`  
- `openstreetmap.org` یا `osm.org`

اگه پارامتر ندی، اسکریپت خودش آدرس رو ازت می‌پرسه.

---

## چندتا مثال

### لینک نشانه

```bash
./osm-generator.sh "https://neshan.org/c/36.323152-59.491718-17"
```

خروجی:

```
https://www.openstreetmap.org/?mlat=36.323152&mlon=59.491718#map=17/36.323152/59.491718
```

### لینک گوگل مپس

```bash
./osm-generator.sh "https://www.google.com/maps/@36.323152,59.491718,17z"
```

همون خروجی بالا رو می‌ده.

### لینک OSM

```bash
./osm-generator.sh "https://www.openstreetmap.org/?mlat=36.323152&mlon=59.491718#map=17/36.323152/59.491718"
```

همون لینکی که دادیش رو برمی‌گردونه.

---

## نکات مهم

- فقط لینک‌های نشنان، گوگل مپس و OSM رو می‌شناسه
- اگه لینک فرمت ناشناخته باشه، می‌گه: `unknown location link format`
- خروجی همیشه یه لینک قابل استفاده توی OpenStreetMap با زوم ۱۷ هست