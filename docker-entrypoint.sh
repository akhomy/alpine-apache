#!/bin/sh

set -e

# Copy user defined configs from temp folder to existing.
if [ "$(ls -A /temp_configs_dir)" ]; then
  cp -f -R /temp_configs_dir/* /etc/
fi

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

if [ -n "$PROXY_PASS" ]; then
     sed -i 's@^    ProxyPass.*@'"    ProxyPass ${PROXY_PASS}"'@' /etc/apache2/httpd.conf
fi

if [ -n "$APACHE_LISTEN_PORT" ]; then
     sed -i 's@^Listen.*@'"Listen ${APACHE_LISTEN_PORT}"'@' /etc/apache2/httpd.conf
fi

httpd -D FOREGROUND
