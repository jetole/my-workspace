### This Makefile is used for local building and testing

IMAGE_NAME ?= container-toobox
IMAGE_REF ?= localhost/${IMAGE_NAME}:latest
TEST_CONTAINER_NAME ?= test-${IMAGE_NAME}
CONTAINER_NAME ?= ${IMAGE_NAME}

.DEFAULT_GOAL := build-test
.PHONY: build clean-container clean-image clean test build-test

build: clean
	@echo "Building ${IMAGE_REF}..."
	buildah bud \
		--tag ${IMAGE_REF} \
		--no-cache

clean-container:
	podman container exists "${TEST_CONTAINER_NAME}" && podman rm -f "${TEST_CONTAINER_NAME}" || true

clean-image:
	podman rmi -f "${IMAGE_REF}"

clean: clean-container clean-image

test: clean-container
	SHELL=/bin/zsh distrobox create -i "${IMAGE_REF}" -n "${TEST_CONTAINER_NAME}"
	SHELL=/bin/zsh distrobox enter "${TEST_CONTAINER_NAME}"

build-test: build test

deploy:
	SHELL=/bin/zsh distrobox create -i "${IMAGE_REF}" -n "${CONTAINER_NAME}"
