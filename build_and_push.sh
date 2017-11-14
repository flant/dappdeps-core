#!/bin/bash

dapp dimg build
docker login -u $DOCKER_HUB_LOGIN -p $DOCKER_HUB_PASSWORD
dapp dimg spush dappdeps/core --tag 0.1.0
