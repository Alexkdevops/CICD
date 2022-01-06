version = 1.3
account = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(account).dkr.ecr.us-east-1.amazonaws.com/webapp:$(version)
namespace = webapi

login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(account).dkr.ecr.us-east-1.amazonaws.com

build:
	@docker build -t $(image) .

push: login
	@# docker login is not here
	@docker push $(image)

deploy:
	@cat deployment.yaml | sed "s|IMAGEVERSION|$(version)|g;s|NAMESPACE|$(namespace)|g;s|ACCOUNT|$(account)|g" | kubectl apply -f -
