FROM nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./content /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]