version = 1.4
account = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(account).dkr.ecr.us-east-1.amazonaws.com/apiapp:$(version)

login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(account).dkr.ecr.us-east-1.amazonaws.com

build: login
	@docker build -t $(image) .
	@docker tag apiapp:$(version) $(account).dkr.ecr.us-east-1.amazonaws.com/apiapp:$(version)

push: build
	@docker push $(image)

deploy:
	@cat deployment.yaml | sed "s|IMAGEVERSION|$(version)|g;s|NAMESPACE|$(namespace)|g;s|ACCOUNT|$(account)|g" | kubectl apply -f -

