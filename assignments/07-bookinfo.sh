#!/bin/bash
docker build -t ratings bookinfo/ratings/.
docker run -d --name mongodb -p 27017:27017 -v $(pwd)/bookinfo/ratings/databases:/docker-entrypoint-initdb.d bitnami/mongodb:5.0.2-debian-10-r2
docker run -d --name ratings -p 8080:8080 --link mongodb:mongodb -e SERVICE_VERSION=v2 -e 'MONGO_DB_URL=mongodb://mongodb:27017/ratings' ratings
docker build -t reviews bookinfo/reviews/.
docker run -d --name reviews --link ratings:ratings -p 8082:8082 -e "RATINGS_SERVICE=http://ratings:8080" -e "ENABLE_RATINGS=true" reviews