FROM debian:bookworm

WORKDIR /app

RUN apt-get update && apt-get install nginx openssl -y

COPY nginx.conf /etc/nginx

COPY entry.sh .

RUN chmod +x entry.sh

ENTRYPOINT ["./entry.sh"]

CMD ["nginx", "-g", "daemon off;"]
