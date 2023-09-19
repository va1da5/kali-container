.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "build               - build Kali container image"
	@echo "deploy              - creates a symlinc to the run.sh script"	

.PHONY: build
build:
	docker build -t $$USER/kali --file Dockerfile files
# --no-cache 


.PHONY: build+reversing
build+reversing:
	docker build --no-cache -t $$USER/kali --file Dockerfile.reversing files


.PHONY: deploy
deploy:
	sudo ln -s "$$PWD/run.sh" "/usr/local/bin/kali-here"