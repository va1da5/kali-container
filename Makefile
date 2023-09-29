.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "build               - builds Kali container image"
	@echo "deploy              - creates a symlink to the run.sh script"

.PHONY: build
build:
	docker build --no-cache -t $$USER/kali --file Dockerfile files



.PHONY: build+reversing
build+reversing:
	docker build --no-cache -t $$USER/kali --file Dockerfile.reversing files


.PHONY: deploy
deploy:
	sudo rm -rf /usr/local/bin/kali-here /usr/local/bin/kali-attach
	sudo ln -s "$$PWD/run.sh" "/usr/local/bin/kali-here"
	sudo ln -s "$$PWD/run.sh" "/usr/local/bin/kali-attach"