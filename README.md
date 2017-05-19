### Apache2 MPM
Apache2 MPM image based on Alpine linux.

### Available options

APACHE_LISTEN_PORT - port on which apache will be listen inside container
PROXY_PASS - proxy for processing php requests.
DOCUMENT_ROOT - DocumentRoot option in httpd.conf
DIRECTORY - <Directory option value in httpd.conf

### How to run

Run on port 8080 image, be aware first you need start proxy php container
docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8002:8080  -e APACHE_LISTEN_PORT="8080" -e PROXY_PASS="fcgi://php-fpm:8000 /var/www/localhost/htdocs" --name apache2_mpm_container --link php-proxy-container lordius/alpine-apache:apache-2.4.23-mpm 
