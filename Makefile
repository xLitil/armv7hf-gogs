IMAGENAME=xlitil/armv7hf-gogs
TAGNAME=0.9.13
CONTAINERNAME=go-git-server


default: clean build

build: 
	docker build --tag $(IMAGENAME):$(TAGNAME) .

run:
	docker run --detach --name $(CONTAINERNAME) --privileged=true --publish 3000:3000 --volume `pwd`/gogs-data/:/data $(IMAGENAME):$(TAGNAME)

bash:
	docker exec --interactive --tty $(CONTAINERNAME) /bin/bash

push:
	docker push $(IMAGENAME):$(TAGNAME)

cleanContainer:
	docker rm -f $(CONTAINERNAME) || true

cleanImage:
	docker rmi -f $(IMAGENAME):$(TAGNAME) || true


clean: cleanContainer cleanImage
