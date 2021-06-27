FROM centos

#MAINTAINER sai@hcl.com

RUN yum install httpd -y

COPY food-master/* /var/www/html/food-master

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
