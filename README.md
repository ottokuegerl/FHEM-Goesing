# FHEM-Goesing-Docker-Base

## Contains

- FHEM
- mySQL-Logging

## Install

- login to github --> https://github.com
  source: /home/intel-nuc/github/FHEM-Goesing
  git status
  git add .
  git commit -m "modified fhem.cfg.example"
  git push
  git status
- clone repository to local system
- cd /home/intel-nuc/docker
- git clone https://github.com/ottokuegerl/FHEM-Goesing.git
- cd FHEM-Goesing
- cp ./fhem/data/fhem.cfg.example ./fhem/data/fhem.cfg
- docker-compose build
- docker images

## Start Container

- parameter -d --> all container will start in background
- docker-compose up -d
- http://172.16.109.1:8083 or http://192.168.1.1:8083

## Defaults

- FHEM-WEB: 8083 (8084 and 8085 have been deleted)
- mySQL-User: fhemuser
- mySQL-Password: 2jRHnEi3WuNSQAcX7

## Updating FHEM

Since all data in the container is static, you have to delete the container and recreate it to update fhem.

## Error handling
- ERROR: for fhem no such image:
- ERROR: Encountered errors while bringing up the project
- docker-compose rm then docker-compose up -d --> fixes the issue

## Modification within container
- docker ps --> see container id
- docker exec -ti <container_id> bash
- root@f42651c7dc3a:/opt/fhem# apt-get install curl

## Portainer
- Alle Container können komfortabel über die Portainer-Oberfläche verwaltet werden
- docker pull portainer/portainer
- docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
- docker run -d -p 9000:9000 portainer/portainer
- You'll just need to access the port 9000 of the Docker engine where portainer is running using your browser. 
- http://172.16.109.1:9000 or http://192.168.1.1:9000

