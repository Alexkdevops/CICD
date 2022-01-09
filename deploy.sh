#!/bin/bash

export AWS_DEFAULT_REGION=us-east-2

if [[ $BRANCH_NAME == "main" ]]
then
    cd api/
    make build namespace=main
    make push namespace=main
    make deploy namespace=main
    cd ..
    cd web/
    make build namespace=main
    make push namespace=main
    make deploy namespace=main
    cd ..
elif [[ $BRANCH_NAME == "dev" ]]
then
    cd api/
    make build namespace=dev
    make push namespace=dev
    make deploy namespace=dev
    cd ..
    cd web/
    make build namespace=dev
    make push namespace=dev
    make deploy namespace=dev
    cd ..
elif [$BRANCH_NAME == "prod"]