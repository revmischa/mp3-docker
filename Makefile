TEMPLATE_NAME ?= mp3

shell: image
	docker run -a stdin -a stdout -i -t $(TEMPLATE_NAME) /bin/bash

image:
	docker build -t $(TEMPLATE_NAME) .

push:
	docker tag $(TEMPLATE_NAME):latest revmischa/mp3
	docker push revmischa/mp3
