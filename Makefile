.PHONY: update update-system clean news

update:
	home-manager switch --flake .#kamil

update-system:
	sudo nixos-rebuild switch --flake .#thinkpad

clean:
	nix-collect-garbage -d

news:
	home-manager news --flake .
