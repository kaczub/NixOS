.PHONY: update update-flake test clean check check-all fmt noctalia-export mac mac-build mac-rollback

NIXOS_HOST ?= thinkpad
MAC_HOST ?= mac-mini

# Zgodność wstecz: make update HOST=...
HOST ?= $(NIXOS_HOST)

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

check-all:
	nix flake check --no-build --all-systems

fmt:
	nix fmt .

noctalia-export:
	./scripts/noctalia-export.sh

# macOS / nix-darwin
mac:
	sudo darwin-rebuild switch --flake .#$(MAC_HOST)

mac-build:
	darwin-rebuild build --flake .#$(MAC_HOST)

mac-rollback:
	sudo darwin-rebuild --rollback
