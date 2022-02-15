#!/bin/bash
set -ex
export AWS_DEFAULT_REGION=us-east-2

cd api/
make build
make push
make deploy
cd ..