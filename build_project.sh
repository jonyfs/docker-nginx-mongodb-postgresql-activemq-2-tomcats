#!/bin/sh

########################################################################
#
# title:          Build Complete Project
# author:         Jony Santos 
# url:              
# description:    
#
# to run:         sh ./build_project.sh
#
########################################################################

# clone project
# git clone -b master \
#   --single-branch https://github.com/garystafford/spring-music-docker.git && 
# cd spring-music-docker

# build VM
# docker-machine create --driver virtualbox testserver --debug

# create directory to store mongo data on host
# docker-machine ssh testserver mkdir /opt/mongodb

# set new environment
#docker-machine env testserver && \
#eval "$(docker-machine env testserver)"

# build images and containers
docker-compose -f docker-compose.yml -p testserver up -d

# configure local DNS resolution for application URL
#echo "$(docker-machine ip springmusic)   springmusic.com" | sudo tee --append /etc/hosts

# wait for container apps to start
#sleep 15

# run quick test of project
#for i in {1..10}
#do
#  curl -I --url $(docker-machine ip testserver)
#done
