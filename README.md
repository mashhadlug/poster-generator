این زیرپوشه پوستر هر رویداد را تولید می‌کند. کافیست در پوشه `events` یک فایل با فرمت `vars` ایجاد کرده و اطلاعات آن را پر کنید، سپس میتوانید تصویر پوستر
جلسه را با وارد کردن نام آن رویداد تولید کنید.

پیش از اجرای پروژه نیازمندی های آن را نصب کنید.

```bash
sudo apt install texlive texlive-xetex texlive-lang-other texlive-fonts-extra poppler-utils qrencode evince gettext
```

# ساختن پوستر

در این مثال فرض می‌شود که شماره رویداد مورد نظر ۳۰۰ است. توجه کنید که اگر بخواهید پوستر یک رویداد در گذشته را بسازید نیازی به ساخت مجدد آن نیست.

```bash
cp events/template.vars events/300.vars
make EVENT_NUMBER=300
```

