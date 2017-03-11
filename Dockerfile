#lordius/alpine-apache:apache-2.4.23-mpm
FROM alpine:3.4
MAINTAINER lordius<andriy.khomych@gmail.com>
#Listen Port
ENV APACHE_LISTEN_PORT 80
ENV PROXY_PASS fcgi://php-fpm:8000 /var/www/localhost/htdocs

# Install apache2
RUN apk add --no-cache apache2 \
                       apache2-proxy 
RUN mkdir -p /run/apache2
#COPY crontasks.txt /home
#RUN crontab /home/crontasks.txt


#Configure apache2 for work in mpm mode, enable mod rewrite by copy our config files
RUN rm -R /etc/apache2/*
ADD configs/apache2 /etc/apache2
# Configure httpd.conf, setup host and port of proxy that would used by php-fpm
#RUN sed -i \
#    -e "s/^fcgi:\/\/php-fpm:8000.*/fcgi:\/\/${PROXY_HOST}:${PROXY_PORT}/" \
#    /etc/apache2/httpd.conf
    
#Clean trash
RUN  rm -rf /var/lib/apt/lists/* && \
     rm -rf /var/cache/apk/* && \
     rm -rf /var/www/localhost/htdocs/*
  
COPY docker-entrypoint.sh /usr/local/bin/ 
RUN  chmod +x /usr/local/bin/docker-entrypoint.sh 
#Setup workdir directory
WORKDIR /var/www/localhost/htdocs
VOLUME ["/var/www/localhost/htdocs"]  
RUN chmod +x /var/www/localhost/htdocs
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80
