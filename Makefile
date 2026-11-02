.PHONY: update clean check fmt

update:
	sudo nixos-rebuild switch --flake .#thinkpad

update-flake:
	sudo nix flake update

clean:
	sudo nix-collect-garbage -d

check:
	nix flake check --no-build

fmt:
	nix fmt .
