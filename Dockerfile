FROM ubuntu

#MAINTAINER sai@hcl.com

RUN yum install apache/airflow -y

COPY food-master/* /var/www/html/food-master

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
