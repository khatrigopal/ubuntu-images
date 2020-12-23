FROM ubuntu:20.04
MAINTAINER sudhams reddy duba<dubareddy.383@gmail.com>
RUN apt update && \
    apt install -y iputils-ping iproute2
RUN apt install -y nginx
COPY index.html /usr/share/nginx/html/index.html
COPY index.html /var/www/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
