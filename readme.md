# Dockerized PHP Application with Nginx, MariaDB, and Cron Jobs

## Project Overview
This project sets up a **PHP web application** with **Nginx, MariaDB**, and **Cron Jobs** using Docker and Docker Compose. The setup is designed for easy deployment and development in a containerized environment.

<br />

## Project Structure
```
DOCKER_SETUP/
│── docker/
│   ├── cron/
│   │   ├── Dockerfile          # Dockerfile for cron service
│   │   ├── crontab             # Crontab file with scheduled jobs
│   ├── nginx/
│   │   ├── Dockerfile          # Dockerfile for Nginx server
│   │   ├── generate-ssl.sh     # Script to generate SSL certificates
│   │   ├── nginx.conf          # Nginx configuration file
│   ├── basis_member/
│   │   ├── Dockerfile          # Dockerfile for PHP-FPM service
│   ├── basis_admin/
│   │   ├── Dockerfile  
│── log/
│   ├── cron/
│   │   ├── cron.log            # Log file for cron job execution
│── src/
│   ├── basis_member/
│   │   ├── public/
│   │   │   ├──index.php         # Sample PHP entry point
│   ├── basis_admin/
│   │   ├── public/
│   │   │   ├──index.php         # Sample PHP entry point
│── docker-compose.override.yml   # Overrides for local development
│── docker-compose.prod.yml       # Configuration for production
│── docker-compose.uat.yml        # Configuration for UAT
│── docker-compose.yml            # Main Docker Compose file
│── readme.md                     # Project documentation
```
<br />

## Services Overview

### 1. PHP Service (basis_member)
- **Builds from:** `docker/basis_member/Dockerfile`
- **Mounts source code:** `./src:/srv`
- **Runs on:** `app_network`
- **Build Args:** `WORKDIR=${WORKDIR:-/srv/basis_member}`

### 2. PHP Service (basis_admin)
- **Builds from:** `docker/basis_admin/Dockerfile`
- **Mounts source code:** `./src:/srv`
- **Runs on:** `app_network`
- **Build Args:** `WORKDIR=${WORKDIR:-/srv/basis_admin}`

### 3. Nginx Service
- Serves the PHP application
- Depends on PHP service

### 4. Cron Service
- Runs scheduled tasks
- Mounts logs to `log/cron`

<br />

## Running the Containers

### Local Environment
```sh
docker-compose up -d
```

### Development Environment
```sh
docker-compose -f docker-compose.yml -f docker-compose.uat.yml up -d
```

### Production Environment
```sh
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

<br />

## Networking
All services run within the `app_network` Docker network.

<br />

## Logs
- Cron logs are stored in `log/cron/cron.log`

<br />

## Access the application
- basis_member `https://local.infoctosbasis.com/`
- basis_admin `https://local.infoadmin.com/`

<br />

## Useful command
### After updating nginx file
```sh
docker-compose build --no-cache <service>
docker-compose up -d --force-recreate <service>

#example
docker-compose build --no-cache nginx
docker-compose up -d --force-recreate nginx

```

## Author
Maintained by **CTOS Basis** - Feel free to contribute or report issues!

