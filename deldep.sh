#!/bin/bash
k delete deploy alex-api -n prod
k delete deploy alex-web -n prod
k delete deploy alex-api -n dev
k delete deploy alex-web -n dev