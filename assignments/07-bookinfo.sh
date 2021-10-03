#!/bin/bash
docker build -t ratings bookinfo/ratings/.
docker build -t reviews bookinfo/reviews/.
docker build -t details bookinfo/details/.
docker build -t productpage bookinfo/productpage/.
docker run -d --name mongodb -p 27017:27017 -v $(pwd)/bookinfo/ratings/databases:/docker-entrypoint-initdb.d bitnami/mongodb:5.0.2-debian-10-r2
docker run -d --name ratings -p 8080:8080 --link mongodb:mongodb -e SERVICE_VERSION=v2 -e 'MONGO_DB_URL=mongodb://mongodb:27017/ratings' ratings
docker run -d --name reviews -p 8082:9080 --link ratings:ratings -e "RATINGS_SERVICE=http://ratings:8080" -e "ENABLE_RATINGS=true" reviews
docker run -d --name details -p 8081:8081 -e "ENABLE_EXTERNAL_BOOK_SERVICE=true" details
docker run -d --name productpage -p 8083:8083 --link details:details --link reviews:reviews --link ratings:ratings -e "DETAILS_HOSTNAME=http://details:8081" -e "REVIEWS_HOSTNAME=http://reviews:9080" -e "RATINGS_HOSTNAME=http://ratings:8080" productpage