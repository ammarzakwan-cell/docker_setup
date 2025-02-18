# Dockerized PHP Application with Nginx, MariaDB, and Cron Jobs

## Project Overview
This project sets up a **PHP web application** with **Nginx, MariaDB**, and **Cron Jobs** using Docker and Docker Compose. The setup is designed for easy deployment and development in a containerized environment.

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
│   ├── php/
│   │   ├── Dockerfile          # Dockerfile for PHP-FPM service
│── log/
│   ├── cron/
│   │   ├── cron.log            # Log file for cron job execution
│── src/
│   ├── public/
│   │   ├── index.php           # Sample PHP entry point
│── .env                         # Environment variables for development
│── .env.prod                    # Environment variables for production
│── .env.uat                     # Environment variables for UAT (User Acceptance Testing)
│── docker-compose.override.yml   # Overrides for local development
│── docker-compose.prod.yml       # Configuration for production
│── docker-compose.uat.yml        # Configuration for UAT
│── docker-compose.yml            # Main Docker Compose file
│── readme.md                     # Project documentation
```

## Services
This project includes the following services defined in `docker-compose.yml`:

### 1️⃣ PHP (Backend Service)
- **Builds from:** `docker/php/Dockerfile`
- **Mounts source code:** `./src:/var/www/html`
- **Depends on:** `mariadb`
- **Runs on:** `app_network`

### 2️⃣ MariaDB (Database)
- **Uses Image:** `mariadb:11`
- **Stores data in volume:** `${MARIADB_VOLUME}`
- **Environment Variables:**
  - `MARIADB_ROOT_PASSWORD` (from `.env`)
- **Runs on:** `app_network`

### 3️⃣ Nginx (Web Server)
- **Uses `nginx.conf` for configuration**
- **Mounts source code:** `./src:/var/www/html`
- **Depends on:** `php`
- **Runs on:** `app_network`

### 4️⃣ Cron (Scheduled Jobs)
- **Builds from:** `docker/cron/Dockerfile`
- **Mounts source code:** `./src:/var/www/html`
- **Stores logs in:** `./log/cron:/var/log/cron`
- **Runs on:** `app_network`

## Getting Started
### 1️⃣ Install Docker & Docker Compose
Ensure you have Docker and Docker Compose installed:
- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)

### 2️⃣ Set Up Environment Variables
Copy `.env.example` to `.env` and update necessary values:
```sh
cp .env.example .env
```
Modify `.env` as needed for your local development.

### 3️⃣ Build and Start Services
To start all services:
```sh
docker-compose up --build -d
```

### 4️⃣ Verify Running Containers
Check if all services are running:
```sh
docker ps
```

### 5️⃣ Access the Application
- **Nginx (Frontend):** `http://localhost`
- **PHP (API):** `http://localhost/index.php`
- **MariaDB:** Connect using a database client with credentials from `.env`
- **Cron Logs:**
  ```sh
  docker exec -it cron tail -f /var/log/cron/cron.log
  ```

## Running the Containers

### Local Environment
```sh
docker-compose up -d
```

### Development Environment
```sh
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```

### Production Environment
```sh
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

## Stopping & Cleaning Up
To stop and remove containers:
```sh
docker-compose down
```
To remove volumes as well:
```sh
docker-compose down -v
```

## Additional Configurations
### Changing Timezone
The project is configured for **Asia/Kuala Lumpur**. If you need a different timezone, update `Dockerfile` for PHP, Nginx, and Cron with:
```dockerfile
ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
```

### Debugging Cron Jobs
To list the current cron jobs inside the container:
```sh
docker exec -it cron crontab -l
```
To manually trigger a cron job:
```sh
docker exec -it cron sh -c 'run-parts /etc/periodic/1min'
```

## Author
Maintained by **ammar** - Feel free to contribute or report issues!

