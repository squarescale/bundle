.DEFAULT_GOAL := help
.PHONY: build-image lint

lint: ## Lint Dockerfile
	docker run --rm -it --privileged -v $$PWD:/root/ projectatomic/dockerfile-lint dockerfile_lint
	docker run --rm -i sjourdan/hadolint < Dockerfile

build-image: ## Build docker image
	docker build -t bundle .

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

