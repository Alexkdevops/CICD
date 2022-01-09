#!/bin/bash
kubectl delete deploy alex-api -n prod
kubectl delete deploy alex-web -n prod
kubectl delete deploy alex-api -n dev
kubectl delete deploy alex-web -n dev