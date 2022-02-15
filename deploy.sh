#!/bin/bash

set -ex # good for bash-scripting trublesoots
export AWS_DEFAULT_REGION=us-east-2

cd api/
make build 
make push 
make deploy 
cd ..


 