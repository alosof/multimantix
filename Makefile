SHELL := /bin/bash
.SHELLFLAGS = -ec
.ONESHELL:
.SILENT:


.PHONY: help
help:
	echo "❓ Use \`make <target>'"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'


.PHONY: build ## 🛠 Build server container
build:
	docker build -t multimantix .


.PHONY: start ## 🔌 Run server container
start:
	docker run --name multimantix \
			   --rm \
			   -d \
   			   -p 8080:8080 \
   			   multimantix


.PHONY: logs ## 📒 Stream server logs
logs:
	docker logs -f multimantix


.PHONY: destroy ## 💣 Destroy server container
destroy:
	docker rm -f multimantix
