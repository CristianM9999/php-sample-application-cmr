# PHP 7.1 sample application and MariaDB running in Docker

Twitter like application where inter-galactic characters exchange opinions!

Deployed in two docker containers. One for the PHP v7.1 app an another one for the MariaDB database. 

## Requirements

* Unix-like operating systems
* Docker 

## Setup

1. Clone the repository 

```bash
git clone https://github.com/CristianM9999/php-sample-application-cmr.git
```
2. Change directory

```bash
cd php-sample-application-cmr/
```

3. Run the docker compose

```bash
sudo docker compose up --build
```
4. Check that both containers were started succesfully: 

```bash
sudo docker ps
```

You are all set, point your browser to http://localhost/ 
