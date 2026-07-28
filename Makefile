.PHONY: update
update:
	home-manager switch --flake .#kamil

.PHONY: clean
clean:
	nix-collect-garbage -d
