#!/bin/env bash
DIR=(alist ddns homarr kuma dockge adguardhome)
for dir in ${DIR[@]}; do
	cd $dir
	docker-compose pull
	docker-compose up -d
	cd ..
done
echo "Docker compose update done!"
