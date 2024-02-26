<div style="direction: rtl; text-align: right;" contenteditable="true">

# ویکیسین

در این پروژه یک [هَسْتیک](https://fa.wiktionary.org/wiki/هستیک) از ویکی‌مدیا به پورت محلی «8090» و یک هستیک از phpMyAdmin، برای [دَبِّریدَن](https://fa.wiktionary.org/wiki/دبریدن) ‌(مدیریت کردن) پایگاه‌داده، به پورت محلی «8091» [داکِریسِشْته شده](https://fa.wiktionary.org/wiki/داکریسشتن) (داکرسازی شده است).

## نیازمندی‌ها

برای بهریدن از این پروژه باید [داکر](https://docs.docker.com/engine/install/) و بسته [Makefile](https://www.gnu.org/software/make/manual/make.html) برروی سیستمتان [نصبشته باشد](https://fa.wiktionary.org/wiki/نصبشتن) (نصب شده باشد). برای [نصبیدن](https://fa.wiktionary.org/wiki/نصبیدن) Makefile کافیه در گوگل [بجویی](https://fa.wiktionary.org/wiki/جوییدن) (جستجو کنی).

## [بهرش](https://fa.wiktionary.org/wiki/بهرش) (روش استفاده)

به دو روش می‌توان این پروژه را [بَرْپید](https://fa.wiktionary.org/wiki/برپیدن) (برپا کرد):

1. [بَهْریدَن](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کردن از) دستور `make init`.
2. [پِیْکریدَن](https://fa.wiktionary.org/wiki/پیکریدن) (پیکربندی کردن) از ابتدا.

### بَهْریدَنِ دستور `init`

در این روش، پایگاه‌داده با [یه](https://fa.wiktionary.org/wiki/یه) [پِیکرش](https://fa.wiktionary.org/wiki/پیکرش) (تنظیمات) اولیه [آغازِشَد](https://fa.wiktionary.org/wiki/آغازشتن) (راه اندازی شود). برای اینکار، کافیه در [یه](https://fa.wiktionary.org/wiki/یه) [کارْهال](https://fa.wiktionary.org/wiki/کارهال) (پایانه؛ ترمینال؛ کنسول) دستور زیر [اِجْرِشْته شود](https://fa.wiktionary.org/wiki/اجرشتن) (اجرا شود):

<div style="direction: ltr; text-align: left;" contenteditable="true">

```bash
make init
```

</div>

با اینکار حداقل افزونه‌های موردنیاز برای نوشتن متن‌های علمی (شامل متن‌های ریاضی، کد برنامه‌نویسی و غیره) و سازمانی همراه با عکس، فیلم، و صوت به چند زبان [نصباشَد](https://fa.wiktionary.org/wiki/نصباشتن) (نصب شود)، و یه کاربر [دَبِّرِشی](https://fa.wiktionary.org/wiki/دبرش) (مدیریت) به شناسه «hakhsin» و گذرواژه «hakhsin_password» [ایجایشد](https://fa.wiktionary.org/wiki/ایجاشتن) (ایجاد شود). نام ویکی، که ازطریق فایل `LocalSettings.php` می‌توان [عَوَضید](https://fa.wiktionary.org/wiki/عوضیدن) اش، «ویکیسین» است.

**توجه.** نامکاربردی، گذرواژه، نام دانشنامه و همه [پِیکرش](https://fa.wiktionary.org/wiki/پیکرش) اولیه نیز ازطریق فایل «LocalSettings.php» [پیکرپذیر](https://fa.wiktionary.org/wiki/پیکرپذیر) (قابل تنظیم) است. فقط باید پس از [ریپیکریدَن](https://fa.wiktionary.org/wiki/ریپیکریدن) (تنظیمات مجدد) افزونه‌ها، دستور زیر [اِجْراشد](https://fa.wiktionary.org/wiki/اجراشتن) (اجرا شود):

<div style="direction: ltr; text-align: left;" contenteditable="true">

```bash
make update
```

</div>

### پیکریدن از ابتدا

برای [پِیْکریدن](https://fa.wiktionary.org/wiki/پیکریدن) از ابتدای ویکی:

1. فایل `LocalSettings.php` را از پوشه <span dir="ltr" contenteditable="true">`./settings`</span> [بِحَذف](https://fa.wiktionary.org/wiki/حذفیدن) (حذف کن)؛
2. ابتدای عبارت <span dir="ltr" contenteditable="true">`./settings/<service_name>/LocalSettings.php:...`</span> در فایل `compose.yml` [نویسه](https://fa.wiktionary.org/wiki/نویسه) `#` [بِنِه](https://fa.wiktionary.org/wiki/نهیدن) تا بعنوان [وَصْفایَنده](https://fa.wiktionary.org/wiki/وصفاینده) (comment) [انگاشته شود](https://fa.wiktionary.org/wiki/انگاشتن) (درنظر گرفته شود)؛
3. با [یه](https://fa.wiktionary.org/wiki/یه) مرورگر وارد «http://localhost:8090» بشو، و بنابر نیازت، ویکیت را [بِپِیْکر](https://fa.wiktionary.org/wiki/پیکریدن) (پیکر بندی کن).
4. فایل `LocalSettings.php`، که در آخر پیکرش بهت [دِهایِشَد](https://fa.wiktionary.org/wiki/دهاشته) (داده شود)، را در پوشه [پِیکرالهت](https://fa.wiktionary.org/wiki/پیکرال) (تنظیم‌کننده؛ <span dir="ltr" contenteditable="true">`./settings/LocalSettings.php`</span>) [بِنِه](https://fa.wiktionary.org/wiki/نهیدن) (قرار بده)؛
5. دستور زیر را در [یه](https://fa.wiktionary.org/wiki/یه) [وَصلار](https://fa.wiktionary.org/wiki/وصلار) (پایانه؛ terminal) [بِاِجْرْ](https://fa.wiktionary.org/wiki/اجریدن) (اجرا کن) تا کانتینرها (همان ماشین‌های مجازیت) [ریشُروعاشته شوند](https://fa.wiktionary.org/wiki/ریشروعاشتن) (ازنو شروع شوند).

<div style="direction: ltr; text-align: left;" contenteditable="true">

```bash
docker compose restart
```

</div>

تمام!

## یارسین

«یارسین» [یه](https://fa.wiktionary.org/wiki/یه) مجموعه دستور شل موردنیاز برای [مانالوزدن](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ گرفتن) و [پیشاردن](https://fa.wiktionary.org/wiki/پیشاردن) (ریستور کردن) پایگاه‌داده و [دبِّریدن](https://fa.wiktionary.org/wiki/دبریدن) (مدیریت کردن) ایمج‌ها و کانتینرهای داکر این پروژه است.

**توجه.** برای [اِجریدن](https://fa.wiktionary.org/wiki/اجریدن) (اجرا کردن) همه این دستورها به [داکر](www) و بسته [Makefile](www) نیاز است.

* **ساختن ایمیج.** از این برای [ریساختن](https://fa.wiktionary.org/wiki/ریساختن) (بازسازی کردن) ایمیج‌های داکر پس از هر بار [غِیریدن](https://fa.wiktionary.org/wiki/غیریدن) (تغییر دادن) فایل‌های داکر، `Dockerfile`، [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make build
  ```

  </div>

* **اجریدن.** از این برای ساختن و [اجریدن](https://fa.wiktionary.org/wiki/اجریدن) کانتینرهای داکر ویا «ویکیسین» [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make up
  ```

  </div>

* **اجریدن با phpMyAdmin.** اگر می‌خواهی بشکل گرافیکی با [بَهریدن](https://fa.wiktionary.org/wiki/بهریدن) از «phpMyAdmin» پایگاه‌داده‌ات را [بِدَبِّری](https://fa.wiktionary.org/wiki/دبریدن) (مدیریت کنی) این دستور [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make up-admin
  ```

  </div>

* **خامودن.** برای [خامودن](https://fa.wiktionary.org/wiki/خامودن) (خاموش کردن) و  [حَذفیدن](https://fa.wiktionary.org/wiki/حذفیدن) (حذف کردن) کانتینرهایت، باحفظ داده‌هایت، این دستور را [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن). 
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make down
  ```

  </div>

* **آغازیدن.** برای [آغازیدن](https://fa.wiktionary.org/wiki/آغازیدن) (مقدار دهی اولیه کردن) پایگاه‌داده‌ها این دستور را [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make init
  ```

  </div>

* **مانالوزْدَنْ.** برای [مانالوزدن](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ گرفتن) از [سمپاد](https://fa.wiktionary.org/wiki/سمپاد) (DBMS) و عکس‌هایت این دستور را [بِبَهر](https://fa.wiktionary.org/wiki/بهریدن) (استفاده کن).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make backup
  ```

  </div>


* **مانالوزدن سمپاد.** این دستور [سمپاد](https://fa.wiktionary.org/wiki/سمپاد) (DBMS) را [مانالوزد](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ می‌گیرد).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make backup-dbms
  ```

  </div>

  **توجه.** این قویترین [مانالوزش](https://fa.wiktionary.org/wiki/مانالوزش) (بکاپ گیری) است، بطوری که علاوه بر داده‌هایت، اطلاع‌های ‌پایگاه‌داده‌ات نیز [مانالوزده شود](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ‌گیری شود). 

* **مانالوزدن داده‌ها.** در این [مانالوزش](https://fa.wiktionary.org/wiki/مانالوزش) (روش بکاپ‌گیری) تنها داده‌های یکی از پایگاه‌داده‌هایت که باید [بِعَلَنی](https://fa.wiktionary.org/wiki/عینیدن) (تعیین کنی) [مانالوزده شود](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ‌گیری شود).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make backup-data
  ```

  </div>

* **مانالوزدن عکس‌ها.** در این [مانالوزش](https://fa.wiktionary.org/wiki/مانالوزش) (روش بکاپ‌گیری) تنها عکس‌هایت [مانالوزده شود](https://fa.wiktionary.org/wiki/مانالوزدن) (بکاپ‌گیری شود).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make backup-imgs
  ```

  </div>

* **پیشاردن سمپاد.** در این [پیشارش](https://fa.wiktionary.org/wiki/پیشارش) (فرایند ریستور کردن) کل فایل‌ها/داده‌های [سمپاد](https://fa.wiktionary.org/wiki/سمپاد) (DBMS) [پیشارده شود](https://fa.wiktionary.org/wiki/پیشاردن) (ریستور شود).
  
  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make restore-dbms
  ```

  </div>

* **پیشاردن داده.** در این [پیشارش](https://fa.wiktionary.org/wiki/پیشارش) (فرایند ریستور کردن) تنها داده‌های یکی از پایگاه‌داده‌هایت که باید [بِعَلَنی](https://fa.wiktionary.org/wiki/علنیدن) (تعیین کنی) [پیشارده شود](https://fa.wiktionary.org/wiki/پیشاردن).

  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make restore-data
  ```

  </div>

* **پیشاردن عکس‌ها.** در این [پیشارش](https://fa.wiktionary.org/wiki/پیشارش) (فرایند ریستور کردن) تنها عکس‌هایت [پیشارده شود](https://fa.wiktionary.org/wiki/پیشاردن) (ریستور شود).

  <div style="direction: ltr; text-align: left;" contenteditable="true">

  ```bash
  make restore-imgs
  ```

  </div>

**توجه.** این‌ها مجموعه دستورهای پایه و اصلی [استند](https://fa.wiktionary.org/wiki/استیدن) (هستند). باقی بمرور افزوده شوند.

</div>
