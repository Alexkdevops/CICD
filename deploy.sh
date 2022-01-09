#!/bin/bash

# this will force script to exit if any command fails

set -e

export AWS_DEFAULT_REGION=us-east-2

if [[ $BRANCH_NAME == "main" ]]
then
    cd api/
    make build 
    make push 
    make deploy stage=main
    cd ..
    cd web/
    make build 
    make push 
    make deploy stage=main
    cd ..
elif [[ $BRANCH_NAME == "dev" ]]
then
    cd api/
    make build 
    make push 
    make deploy stage=dev
    cd ..
    cd web/
    make build 
    make push 
    make deploy stage=dev
    cd ..
elif [[ $BRANCH_NAME == "prod" ]]
then
    cd api/
    make build 
    make push 
    make deploy stage=prod
    cd ..
    cd web/
    make build 
    make push 
    make deploy stage=prod
    cd ..
fi    