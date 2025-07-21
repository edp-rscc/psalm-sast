# PSALM (STATIC ANALYSIS SECURITY TESTING) For PHP APP

Mari berkenalan dengan project ini, Project ini merupakan sebuah konfigurasi untuk Psalm by Vimeo yang bertujuan untuk melakukan SAST (Static Analysis Security Testing) pada Project berbasis Bahasa Pemrograman PHP. Project ini membungkus package Psalm yang dapat anda gunakan secara mudah melalui docker compose dan dapat di implementasikan dengan CI/CD (Continuous Integration / Continuous Deployment) pada Jenkins, Github Action atau bahkan Gitlab.

## Pra-syarat

Sebelum menggunakan project ini anda diwajibkan untuk mempersiapkan tools berikut agar dapat berjalan dengan baik.

- **Docker Engine** : Anda membutuhkan Docker Engine pada Host atau CI/CD platform agar dapat menjalankan Tools ini melalui Docker

## Pengunaan

Pada tahap ini anda akan dijelaskan terkait penggunaan Project / tools ini untuk testing aplikasi PHP anda :

1. **Pull Docker Images**

```bash
docker pull docker pull ghcr.io/edp-rscc/psalm-sast:latest
```

Anda dapat mendownload Docker Images versi terbaru dengan perintah diatas. Namun anda juga dapat mendownload dengan versi php yang spesifik seperti dibawah ini. Daftar Versi dapat anda lihat [disini](https://github.com/orgs/edp-rscc/packages/container/package/psalm-sast)

```bash
docker pull ghcr.io/edp-rscc/psalm-sast:7.4
```

2. **Mengatur lokasi Project Aplikasi**

```bash
export PHP_APP_LOCATION=/var/www/html
```

Anda dapat mengganti lokasi folder disesuaikan dengan `path` folder aplikasi php yang ingin anda Testing.

3. **Menjalankan Static Analysis Security Testing Aplikasi PHP**

```bash
docker run --rm -it -v $PHP_APP_LOCATION:/var/www/html:rw ghcr.io/edp-rscc/psalm-sast:latest
```

Perintah di atas akan menjalankan testing dan hasilnya akan di tampilkan melalui **Console**. Namun jika anda membutuhkan output berupa file yang dapat di simpan melalui **Artifacts** anda dapat menjalankan perintah ini untuk mendapatkan **file fisik**

```bash
docker run --rm -it -v $PHP_APP_LOCATION:/var/www/html:rw ghcr.io/edp-rscc/psalm-sast:latest --report=/var/www/html/psalm-report.json
```

Dengan perintah diatas akan menyimpan hasil testing pada lokasi project anda atau di `$PHP_APP_LOCATION/psalm-report.json`

> [!NOTE]
> Anda dapat melihat petunjuk yang telah di sediakan oleh psalm dengan menjalankan perintah ini

```bash
docker run --rm -it ghcr.io/edp-rscc/psalm-sast:latest --help
```

Setelah menjalankan perintah di atas anda akan mendapatkan petunjuk pengunaan yang contohnya seperti ini :

```bash
(Psalm 5.7.7@e028ba46ba0d7f9a78bc3201c251e137383e145f crashed due to an uncaught Throwable)
Running Static Analysis Security Testing with Psalm...
Usage:
    psalm [options] [file...]

Basic configuration:
    -c, --config=psalm.xml
        Path to a psalm.xml configuration file. Run psalm --init to create one.

    --use-ini-defaults
        Use PHP-provided ini defaults for memory and error display

    --memory-limit=LIMIT
        Use a specific memory limit. Cannot be combined with --use-ini-defaults

    --disable-extension=[extension]
        Used to disable certain extensions while Psalm is running.

    --threads=INT
        If greater than one, Psalm will run analysis on multiple threads, speeding things up.

    --no-diff
        Turns off Psalm’s diff mode, checks all files regardless of whether they’ve changed.

    --php-version=PHP_VERSION
        Explicitly set PHP version to analyse code against.
...

```

Selamat Mencoba..

## References

- Psalm SAST by Vimeo : [Psalm official documentation](https://psalm.dev/)
- Dockerfile and Images: [Dockerfile Config Official Documentation](https://docs.docker.com/build/concepts/dockerfile/)

## Contributors

Anda dapat berkontribusi ke project ini melalui Pull Request ke Repository ini. Project ini dapat di gunakan oleh public untuk kepentingan personal maupun organisasi.

<hr>

<p align="center"><b>Created By Haikal and EDP RSCC TEAM with ☕️ and ❤️ </b></p>
