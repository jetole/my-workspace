### This Makefile is used for local building and testing

IMAGE_NAME = container-toobox
IMAGE_REF = localhost/${IMAGE_NAME}:latest
TEST_CONTAINER_NAME = test-${IMAGE_NAME}

.DEFAULT_GOAL := btest
.PHONY: build clean-container clean-image clean test btest

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
	distrobox create -i "${IMAGE_REF}" -n "${TEST_CONTAINER_NAME}"
	distrobox enter "${TEST_CONTAINER_NAME}"

btest: build test
