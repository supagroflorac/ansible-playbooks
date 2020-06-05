Rôle docker pour ansible
=======================

Configure un serveur pour utiliser docker.

Chaque service se trouve dans un dossier dans /srv. Un fichier docker-compose.yml y décris chaque container utilisé par le service.
Un fichier docker-[nom-service].service est créé dans le dossier /etc/systemd/system pour chaque service.

Exemple :
 - /sr/[nom-service]
 	- data
	- log
	- conf
	- docker-compose.yml

Le fichier docker-[nom-service].service
```
Requires=docker.service
After=docker.service

[Service]
Restart=always

WorkingDirectory=/srv/[nom-service]

# Remove old containers, images and volumes
ExecStartPre=/usr/local/bin/docker-compose down -v
ExecStartPre=/usr/local/bin/docker-compose rm -v
ExecStartPre=-/bin/bash -c 'docker volume rm $(docker volume ls -q)'
ExecStartPre=-/bin/bash -c 'docker rmi $(docker images | grep "<none>" | awk \'{print $3}\')'
ExecStartPre=-/bin/bash -c 'docker rm -v $(docker ps -aq)'

# Compose up
ExecStart=/usr/local/bin/docker-compose up

# Compose down, remove containers and volumes
ExecStop=/usr/local/bin/docker-compose down -v

[Install]
WantedBy=multi-user.target
```
