#!/bin/bash

export AWS_DEFAULT_REGION=us-east-2
cd api/
make deploy
cd ..
cd web/
make deploy
cd ..