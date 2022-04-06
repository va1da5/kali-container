.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "build               - build Kali container image"
	@echo "deploy              - creates a symlinc to the run.sh script"	

.PHONY: build
build:
	docker build --no-cache -t $$USER/kali files

.PHONY: deploy
deploy:
	sudo ln -s "$$PWD/run.sh" "/usr/local/bin/kali-here"