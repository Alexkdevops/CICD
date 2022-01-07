version = 1.5
account = $(shell aws sts get-caller-identity --query "Account" --output text)
image = $(account).dkr.ecr.us-east-1.amazonaws.com/apiapp:$(version)

login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $(account).dkr.ecr.us-east-1.amazonaws.com

build: login
	@docker build -t $(image) .
	@echo "Done-1"
	@docker tag apiapp:1.5 626144587355.dkr.ecr.us-east-2.amazonaws.com/apiapp:1.5
	@echo "Done-again"
	@docker tag apiapp:$(version) $(account).dkr.ecr.us-east-1.amazonaws.com/apiapp:$(version)
	@echo "Done-2"

push: build
	@docker push $(image)

deploy:
	@cat deployment.yaml | sed "s|IMAGEVERSION|$(version)|g;s|NAMESPACE|$(namespace)|g;s|ACCOUNT|$(account)|g" | kubectl apply -f -

