.PHONY: update clean news

update:
	sudo nixos-rebuild switch --flake .#thinkpad

clean:
	nix-collect-garbage -d

news:
	home-manager news --flake .
