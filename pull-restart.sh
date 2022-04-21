#!/bin/sh

docker stop ApacheServer

docker system prune -f

docker pull pittman31/ceg3120_project5:latest

docker run -d --name ApacheServer -p 80:80 pittman31/ceg3120_project5:latest
