PARA_ID        											:= 2012
CHAIN          											:= kerria-dev


.PHONY: install-all
install-all:
	bash scripts/install-essential.sh
	bash scripts/install.sh
.PHONY: install-essential
install-essential:
	bash scripts/install-essential.sh
.PHONY: aliyun-dev-ecs
aliyun-dev-ecs:
	ACTION=$(ACTION) bash scripts/aliyun.sh
help:
	@grep -E '^[a-zA-Z_-]+:.*?' Makefile | cut -d: -f1 | sort