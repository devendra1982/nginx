#!/bin/sh
echo " "
echo "!!!!!!! This script would pull the image from Dockerhub and push to ECR based on your requirement."
echo "!!!!!!! Please refer to your Dockerfile you are referring to"
echo " "
# Check if the first command-line argument ($1) is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <dockerfile-name> <tag-name> "
  exit 1
fi

if [ -z "$2" ]; then
  echo "Usage: $0 <parameter1> <parameter2>"
  exit 1
fi

echo "The provided parameter is: $1"

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 165485842251.dkr.ecr.ap-south-1.amazonaws.com
tag=$2
docker build -t $tag -f $1 .
docker tag $tag 165485842251.dkr.ecr.ap-south-1.amazonaws.com/care-dev-php:$tag
docker push 165485842251.dkr.ecr.ap-south-1.amazonaws.com/care-dev-php:$tag
