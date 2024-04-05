### This Makefile is used for local building and testing

IMAGE_NAME = localhost/container-toobox
TAGGED_IMAGE_NAME = ${IMAGE_NAME}:latest
TEST_CONTAINER_NAME = test-container-toolbox

.DEFAULT_GOAL := build
.PHONY: build clean-container clean-image clean test btest

build: clean
	@echo "Building ${TAGGED_IMAGE_NAME}..."
	buildah bud \
		--tag ${TAGGED_IMAGE_NAME} \
		--no-cache

clean-container:
	podman container exists "${TEST_CONTAINER_NAME}" && podman rm -f "${TEST_CONTAINER_NAME}" || true

clean-image:
	podman rmi -f "${IMAGE_NAME}"

clean: clean-container clean-image

test: clean-container
	distrobox create -i "${IMAGE_NAME}" -n "${TEST_CONTAINER_NAME}"
	distrobox enter "${TEST_CONTAINER_NAME}"

btest: build test
