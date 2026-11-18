# User Documentation

## What is this project?

This project runs a WordPress website.

It uses Docker containers.

The main services are:

- NGINX: web server
- WordPress: website
- MariaDB: database

## Start the project

Go to the project folder:

```bash
cd inception
```

Start the project:

```bash
make
```

## Stop the project

Stop the containers:

```bash
make down
```

## Access the website

Open this URL in a browser:

```text
[https://localhost](https://localhost) or [https://www.sadaniel.42.fr](https://www.sadaniel.42.fr)
```

## Access the admin panel

Open this URL in a browser:

```text
[https://localhost/wp-admin](https://localhost/wp-admin) or [https://www.sadaniel.42.fr/wp-admin](https://www.sadaniel.42.fr/wp-admin)
```

## Credentials

The credentials are stored in the `.env` file and in secrets files located in secrets/.

The .env file includes:

- Database name
- Database user
- Database admin username
- Database host

The secrets files include:

- Database user password
- Database admin password
- Database root password

## Check the services

Check that the containers are running:

```bash
docker ps or make ps
```

You should see containers for:

- NGINX
- WordPress
- MariaDB

Check the logs:

```bash
docker compose logs or make logs
```

Check the website:

Open `https://localhost` or `https://www.sadaniel.42.fr` in a browser.

If the WordPress page appears, the website is working.