# File_Manager_Docker
File Manager Docker for GK2A-Docker and Himawari-8_Docker.


## Start:

1. Install docker-ce:
```
[tcjj3@debian]$ sudo apt install curl
[tcjj3@debian]$ curl -fsSL get.docker.com -o get-docker.sh
[tcjj3@debian]$ sudo sh get-docker.sh
[tcjj3@debian]$ sudo groupadd docker
[tcjj3@debian]$ sudo usermod -aG docker $USER
[tcjj3@debian]$ sudo systemctl enable docker && sudo systemctl start docker
```

2. Run File_Manager_Docker:
```
[tcjj3@debian]$ docker volume create xrit-rx
[tcjj3@debian]$ docker volume create himawari-rx
[tcjj3@debian]$ docker volume create file_manager_config
[tcjj3@debian]$ docker run -d -i -t \
 --restart always \
 --name=File_Manager \
 -p 5006:5006 \
 -p 9999:9999 \
 -v file_manager_config:/opt/file_manager_config \
 -v xrit-rx:/usr/local/bin/file_manager/xrit-rx \
 -v himawari-rx:/usr/local/bin/file_manager/himawari-rx \
 tcjj3/file_manager_docker:latest
```


## Get Files

### Local Disk
1. xrit-rx:
```
[tcjj3@debian]$ cd /var/lib/docker/volumes/xrit-rx/_data
```
2. himawari-rx:
```
[tcjj3@debian]$ cd /var/lib/docker/volumes/himawari-rx/_data
```

### Via HTTP

1. Website (Default port):
```
http://[Your IP]:5006
```

2. Filebrowser (Default port):
```
http://[Your IP]:9999
```

