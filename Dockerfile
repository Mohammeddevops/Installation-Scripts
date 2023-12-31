FROM ubuntu:latest
MAINTAINER mohammed@gmail.com

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    apache2 \
    unzip

# Download and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start Apache in the foreground
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80

# FROM centos:latest
# MAINTAINER mohammed@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip photogenic.zip
# RUN cp -rvf photogenic/* .
# RUN rm -rf photogenic photogenic.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80 22 
