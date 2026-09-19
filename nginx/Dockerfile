FROM debian:bookworm

RUN apt-get update && apt-get install nginx -y

COPY nginx.conf /etc/nginx

CMD ["nginx", "-g", "daemon off;"]
