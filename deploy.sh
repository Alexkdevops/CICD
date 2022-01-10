#!/bin/bash

# this will force script to exit if any command fails

set -ex # good for bash-scripting trublesoots

export AWS_DEFAULT_REGION=us-east-2

if [[ $BRANCH_NAME == "main" ]]
then
    stage=main
elif [[ $BRANCH_NAME == "dev" ]]
then
    stage=dev
elif [[ $BRANCH_NAME == "prod" ]]
then
    stage=prod
fi    

cd api/
make build stage=$(stage)
make push stage=$(stage)
make deploy stage=$(stage)
cd ..
cd web/
make build stage=$(stage)
make push stage=$(stage)
make deploy stage=$(stage)
cd ..