IMAGE_NAME = localhost/container-toobox

.DEFAULT_GOAL := build
.PHONY: build clean

build:
	@echo "Building ${IMAGE_NAME}:latest..."
	buildah bud \
		--tag ${IMAGE_NAME}:latest \
		--no-cache

clean:
	buildah rmi -f ${IMAGE_NAME}
	buildah rmi -p
