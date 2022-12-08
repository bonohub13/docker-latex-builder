SHELL := bash
DOCKER_IMAGE_NAME := latex

build-linux-image:
	docker build . -t ${DOCKER_IMAGE_NAME}/linux -f docker/Dockerfile.linux

build:
	docker run --rm -it -v ${PWD}:/document ${DOCKER_IMAGE_NAME}/linux
