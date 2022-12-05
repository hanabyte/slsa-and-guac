FROM nginx

COPY ./public/ /var/www
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
