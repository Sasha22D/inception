*This project has been created as part of the 42 curriculum by <sadaniel>.*

# Inception

## Description

This project is a small web infrastructure.

It runs a WordPress website with Docker.

It uses three containers:

- NGINX
- WordPress with PHP-FPM
- MariaDB

The goal is to learn Docker, Docker Compose, networks, volumes and secrets.

## Instructions

### Prerequisites

- Docker
- Docker Compose
- Make

### Installation

Clone the repository:

```bash
git clone <the repo url>
cd inception
```

Edit the `.env` file with your own values.

Values must be placed between quotes.

### Run the project

Build and start the containers:

```bash
make
```

Open the website:

```text
[https://localhost](https://localhost) or [https://www.sadaniel.42.fr](https://www.sadaniel.42.fr)
```

Open the WordPress admin panel:

```text
[https://localhost/wp-admin](https://localhost/wp-admin) or [https://www.sadaniel.42.fr/wp-admin](https://www.sadaniel.42.fr/wp-admin)
```

### Stop the project

Stop the containers:

```bash
make down
```

### Display all Makefile options

Run:

```bash
make help
```

## Docker

### Docker usage

Docker is used to run each service in its own container.

Docker Compose is used to build, configure and start all containers as well as configuring volumes, networks, secrets etc.

The project uses custom Dockerfiles.

The containers communicate through a Docker network configured inside docker-compose file.

### Sources included

- `srcs/requirements/nginx`: NGINX configuration and Dockerfile
- `srcs/requirements/wordpress`: WordPress configuration and Dockerfile
- `srcs/requirements/mariadb`: MariaDB configuration and Dockerfile
- `srcs/docker-compose.yml`: Docker Compose configuration
- `Makefile`: commands to build and run the project
- `srcs/.env`: env variables sample file (must be edited)

### Main design choices

- One container for one service.
- A Docker network connects the containers so they are able to communicate through ports and using their name as IPs.
- Volumes store the WordPress files and mariadb database data. (stored inside /home/sadaniel/data)
- Secrets store sensitive information like passwords.
- NGINX uses TLS on port 443 and redirects all requests from port 80 to 443.

## Virtual Machines vs Docker

| Virtual Machines | Docker |
|---|---|
| A VM has its own full operating system. | A container shares the host operating system (kernel). |
| A VM is heavier and slower to start. | A container is lighter and faster to start. |
| A VM isolates a complete system. | A container isolates an application and its dependencies. |

## Secrets vs Environment Variables

| Secrets | Environment Variables |
|---|---|
| Used for sensitive data. | Used for simple configuration. |
| Examples: passwords, certificates. | Examples: domain name, database name. |
| Stored in secret files. | Stored in the `.env` file. |
| Cannot be displayed in docker inspect | Can be displayed in plain text in docker inspect command |

## Docker Network vs Host Network

| Docker Network | Host Network |
|---|---|
| Containers use their own network. | Containers use the host network. |
| Containers communicate by service name. | Containers can use host ports directly. |
| Better isolation. | Less isolation. |

## Docker Volumes vs Bind Mounts

| Docker Volumes | Bind Mounts |
|---|---|
| Docker manages the storage. | A host folder is mounted in the container. |
| Data is stored by Docker. | Data is stored in a chosen host path. |
| Better for persistent project data. | Useful for development files. |

## Resources

- Docker documentation: https://docs.docker.com/
- Docker Compose documentation: https://docs.docker.com/compose/
- NGINX documentation: https://nginx.org/en/docs/
- WordPress documentation: https://wordpress.org/documentation/
- MariaDB documentation: https://mariadb.org/documentation/

## AI usage

AI was used to:

- Understand Docker and Docker Compose.
- Understand NGINX, WordPress and MariaDB configuration.
- Help debug errors.
- Help write documentation.