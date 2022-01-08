version = 1.5
account = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(account).dkr.ecr.us-east-2.amazonaws.com/webapp:$(version)
namespace = cicd-space

login:
	aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin $(account).dkr.ecr.us-east-2.amazonaws.com

build: login
	@docker build -t $(image) .

push: build
	@docker push $(image)

deploy: push
	@cat deployment.yaml | sed "s|IMAGEVERSION|$(version)|g;s|NAMESPACE|$(namespace)|g;s|ACCOUNT|$(account)|g" | kubectl apply -f -
