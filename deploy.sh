#!/bin/bash

# this will force script to exit if any command fails

set -ex # good for bash-scripting trublesoots

export AWS_DEFAULT_REGION=us-east-2

if [[ $BRANCH_NAME == "main" ]]
then
    stag=main
elif [[ $BRANCH_NAME == "dev" ]]
then
    stag=dev
elif [[ $BRANCH_NAME == "prod" ]]
then
    stag=prod
fi    

cd api/
make build stage=$(stag)
make push stage=$(stag)
make deploy stage=$(stag)
cd ..
cd web/
make build stage=$(stag)
make push stage=$(stag)
make deploy stage=$(stag)
cd ..