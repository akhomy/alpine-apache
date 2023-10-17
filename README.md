# Status
Archived in favor of other tools.

# Apache2 (MPM) image for Docker Compose LAMP stack
Apache2 in MPM mode image based on Alpine Linux.

## Include own configs
You could mount to `/temp_configs_dir` with your volume and use own configs. Variable **USE_ONLY_CONFIGS** - disable using the custom variables in the list below.

## How to run

Run image the on port 8080, be aware first you need start proxy(in [docker-compose-lamp](https://github.com/akhomy/docker-compose-lamp) **PHP-FPM** container).

`docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8002:8080  -e APACHE_LISTEN_PORT="8080" -e PROXY_PASS="fcgi://php-fpm:8000 /var/www/localhost/htdocs" --name apache2_mpm_container --link php-proxy-container akhomy/alpine-apache`

## Environment Variables

| Variable                          | Default Value | Description |
| --------------------------------- | ------------- | ----------- |
| PROXY_PASS                        | `ProxyPass fcgi://php-fpm:8000/var/www/localhost/htdocs/$1`                                        | Line *`ProxyPass`* in the **/etc/apache2/httpd.conf**                                                                    |
| APACHE_LISTEN_PORT                | `Listen 80`                                                                                        | Line *`Listen`* in the **/etc/apache2/httpd.conf**                                                                       |
| APACHE_LISTEN_SSL_PORT            | `Listen 443`, `<VirtualHost _default_:443>`, `ServerName localhost:443`                            | Lines *`Listen`*, *`<VirtualHost _default_:443>`*, *`ServerName localhost:443`* in the **/etc/apache2/conf.d/ssl.conf**   |
| DOCUMENT_ROOT                     | `DocumentRoot "/var/www/localhost/htdocs"`, `DocumentRoot "/var/www/localhost/htdocs"`             | Lines *`DocumentRoot`* in the **/etc/apache2/httpd.conf**, **/etc/apache2/conf.d/ssl.conf**                             |
| DIRECTORY                         | `<Directory "/var/www/localhost/htdocs">`                                                          | Line *`<Directory "/var/www/localhost/htdocs">`* in the **/etc/apache2/httpd.conf**                                      |
| APACHE_TIMEOUT                    | `Timeout 60`                                                                                       | Line *`Timeout`* in the **/etc/apache2/conf.d/default.conf**                                                             |
| USE_ONLY_CONFIGS                  | `0`                                                                                                | Skips using custom variables and only use configs from mounted directory to `/temp_configs_dir`                          |

## Full LAMP stack

See [Docker Compose LAMP](https://github.com/akhomy/docker-compose-lamp).
