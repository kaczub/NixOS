.PHONY: update update-flake test clean check fmt noctalia-export

HOST ?= thinkpad

update:
	sudo nixos-rebuild switch --flake .#$(HOST)

test:
	sudo nixos-rebuild test --flake .#$(HOST)

update-flake:
	nix flake update

clean:
	nix-collect-garbage -d
	sudo nix-collect-garbage -d

check:
	nix flake check --no-build

fmt:
	nix fmt .

noctalia-export:
	./scripts/noctalia-export.sh
