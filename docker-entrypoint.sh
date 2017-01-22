#!/bin/sh

set -e
# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

if [ -n "$PROXY_PASS" ]; then
     sed -i 's@^    ProxyPass.*@'"    ProxyPass ${PROXY_PASS}"'@' /etc/apache2/httpd.conf
fi

if [ -n "$APACHE_LISTEN_PORT" ]; then
     sed -i 's@^Listen.*@'"Listen ${APACHE_LISTEN_PORT}"'@' /etc/apache2/httpd.conf
fi

httpd -D FOREGROUND
