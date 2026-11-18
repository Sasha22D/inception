# Developer Documentation

## Prerequisites

You need these tools:

- Docker
- Docker Compose
- Make
- Git
- Vim

Check Docker:

```bash
docker --version
```

Check Docker Compose:

```bash
docker compose version
```

## Set up the environment

Clone the repository:

```bash
git clone <the repo url>
cd inception
```

Edit the `.env` file:

```bash
vim srcs/.env
```

Set your own values inside the quotes.

Do not commit the `.env` file.

## Build and run the project

Build the images:

```bash
make build
```

Start the containers:

```bash
make
```

Or use Docker Compose directly:

```bash
docker compose -f srcs/docker-compose.yml up --build -d
```

Check the running containers:

```bash
docker ps
```

## Stop the project

Stop the containers:

```bash
make down
```

Or use Docker Compose directly:

```bash
docker compose -f srcs/docker-compose.yml down
```

## Manage the containers

See the containers:

```bash
docker ps
```

See all containers:

```bash
docker ps -a
```

Follow the logs:

```bash
docker compose -f srcs/docker-compose.yml logs -f or make logs
```

Enter a container:

```bash
docker exec -it <container_name> sh
```

Restart a container:

```bash
docker restart <container_name> or make restart to restart all containers
```

Remove stopped containers:

```bash
docker container prune
```

## Manage the volumes

List the volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect <volume_name>
```

Remove unused volumes:

```bash
docker volume prune
```

Remove the project volumes:

```bash
docker compose -f srcs/docker-compose.yml down -v
```

## Project data

The project data is stored in Docker volumes.

The volumes are defined in `srcs/docker-compose.yml`.

The main volumes are:

- WordPress files
- MariaDB database data

The data persists even if the containers are stopped.

If you remove the volumes, the WordPress files and database data are deleted.

## Project structure

```text
inception/
├── Makefile
├── README.md
├── USER_DOC.md
├── DEV_DOC.md
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/
        ├── wordpress/
        └── mariadb/
```

## Useful commands

```bash
make
```

Display all Makefile options.

```bash
make help
```

Build and start the project.

```bash
make down
```

Stop the project.

```bash
docker ps or make ps
```

Check the containers.

```bash
docker compose logs or make logs
```

Check the logs.

```bash
docker volume ls
```

Check the volumes.