NAME=cypress-realworld-app
GIT_TAG=$(shell (git describe --tags 2>/dev/null || echo ""))
CLONE_TAG=$(if $(GIT_TAG),$(GIT_TAG),develop)
DOCKER_TAG=$(if $(GIT_TAG),$(GIT_TAG),latest)

.PHONY:all
all: Makefile Dockerfile cypress-realworld-app
	echo "NAME:      $(NAME)"
	echo "GIT_TAG:   $(GIT_TAG)"
	echo "CLONE_TAG: $(CLONE_TAG)"
	echo "DOCKET_TAG:$(DOCKER_TAG)"
	docker build . --tag $(NAME):$(DOCKER_TAG)

cypress-realworld-app:
	git clone git@github.com:cypress-io/$@.git
	cd $@ && git checkout $(CLONE_TAG)

