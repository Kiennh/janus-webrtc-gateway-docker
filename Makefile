TEMPLATE_NAME ?= janus-webrtc-gateway-docker

build:
	@docker build -t atyenoria/$(TEMPLATE_NAME) .

build-nocache:
	@docker build --no-cache -t atyenoria/$(TEMPLATE_NAME) .

bash: 
	@docker run --rm --net=host --name="janus" -it -t atyenoria/$(TEMPLATE_NAME) /bin/bash

run: 
	@docker run --rm -p 80:80 -p 8088:8088 -p 8188:8188  -v $(pwd)/janus:/usr/local/etc/janus -v /tmp:/tmp --name="janus" -it -t atyenoria/$(TEMPLATE_NAME)

run-host: 
	@docker run --net=host  -v /tmp:/tmp -v $(pwd)/janus:/usr/local/etc/janus --name="janus" -it -t atyenoria/$(TEMPLATE_NAME)


run-mac: 
	@docker run --rm -p 80:80 -p 8088:8088 -p 8188:8188 -v $(pwd)/janus:/usr/local/etc/janus -v /tmp:/tmp --name="janus" -it -t atyenoria/$(TEMPLATE_NAME)

run-hide: 
	@docker run --rm --net=host --name="janus" -it -t atyenoria/$(TEMPLATE_NAME) >> /dev/null
