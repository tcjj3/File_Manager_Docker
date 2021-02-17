# File_Manager_Docker
File Manager Docker for GK2A-Docker and Himawari-8_Docker.

## Start:

1. Install docker-ce:
```
[tcjj3@debian]$ sudo dnf install curl
[tcjj3@debian]$ sudo curl -fsSL get.docker.com -o get-docker.sh
[tcjj3@debian]$ sudo sh get-docker.sh
[tcjj3@debian]$ sudo groupadd docker
[tcjj3@debian]$ sudo usermod -aG docker $USER
[tcjj3@debian]$ sudo systemctl enable docker && sudo systemctl start docker
```

2. Run File_Manager_Docker:
```
[tcjj3@debian]$ docker volume create xrit-rx
[tcjj3@debian]$ docker volume create himawari-rx
[tcjj3@debian]$ docker run -d -i -t \
 --restart always \
 --name=File_Manager \
 -p 5006:5006 \
 -p 9999:9999 \
 -v xrit-rx:/usr/local/bin/file_manager/xrit-rx \
 -v himawari-rx:/usr/local/bin/file_manager/himawari-rx \
 tcjj3/file_manager_docker:latest
```

