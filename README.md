### Apache2 MPM
<p>Apache2 MPM image based on Alpine Linux.</p>

### Include own configs
<p>You could mount to <code>/temp_configs_dir</code> with your volume and use own configs.</p>
<p>USE_ONLY_CONFIGS - disable using of the custom ENV in list bellow.</p>

### Available options
<ul>
<li>PROXY_PASS - <code>/etc/apache2/httpd.conf ProxyPass</code></li>
<li>APACHE_LISTEN_PORT - <code>/etc/apache2/httpd.conf Listen</code></li>
<li>APACHE_LISTEN_SSL_PORT - <code>/etc/apache2/conf.d/ssl.conf | /etc/apache2/conf.d/ssl.conf | /etc/apache2/conf.d/ssl.conf Listen | VirtualHost | ServerName</code></li>
<li>DOCUMENT_ROOT - <code>/etc/apache2/httpd.conf | /etc/apache2/conf.d/ssl.conf DocumentRoot</code></li>
<li>DIRECTORY - <code>/etc/apache2/httpd.conf Directory</code></li>
</ul>

### How to run

<p>Run on port 8080 image, be aware first you need start proxy php container</p>
<code>docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8002:8080  -e APACHE_LISTEN_PORT="8080" -e PROXY_PASS="fcgi://php-fpm:8000 /var/www/localhost/htdocs" --name apache2_mpm_container --link php-proxy-container lordius/alpine-apache:apache-2.4.23-mpm</code>
