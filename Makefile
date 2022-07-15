PARA_ID        											:= 2012
CHAIN          											:= kerria-dev


.PHONY: install
install:
	bash scripts/install.sh

help:
	@grep -E '^[a-zA-Z_-]+:.*?' Makefile | cut -d: -f1 | sort