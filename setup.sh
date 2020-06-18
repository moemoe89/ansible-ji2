#!/bin/bash

if ! [ $(docker ps | grep momo89/go-hostname | wc -l) -gt 0 ]
then
    docker run -p 5000:5000 -d momo89/go-hostname
fi

docker build -t momo89/haproxy .

if ! [ $(docker ps | grep momo89/haproxy | wc -l) -gt 0 ]
then
    docker run -p 80:80 -d momo89/haproxy
fi