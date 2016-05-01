dockerbuild:
	docker rmi -f xlitil/armv7hf-gogs:0.9.13 || true
	docker build -t xlitil/armv7hf-gogs:0.9.13 .

dockerrun:
	docker run -d --name go-git-server --privileged=true --publish 3000:3000 xlitil/armv7hf-gogs:0.9.13


