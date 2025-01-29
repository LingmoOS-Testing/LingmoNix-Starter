# Copyright (c) 2024 LingmoNix Yaksha Project
# LingmoNix's justfile, fit for NixOS 22.11+.
# Licensed under GPL-3.0

#!/usr/bin/env -S just --justfile

recipe:
  cat autoprocess/recipe.txt

flake-init:
  sudo nix flake init -t template
flake-update:
  sudo nix flake update
flake-config:
  sudo nano /etc/nixos/flake.nix

hm-init:
  bash autoprocess/home-manager-init.sh
hm-config:
  sudo nano /etc/nixos/home.nix
hm-switch:
  sudo home-manager switch

viconfig:
  sudo nano /etc/nixos/configuration.nix
deploy:
  sudo nixos-rebuild switch
vm-build:
  sudo nixos-rebuild build-vm

history:
  sudo nix profile history --profile /nix/var/nix/profiles/system

nixlsp:
  sudo nix repl

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

switch:
  bash autoprocess/flavors.sh
gc:
  sudo nix store gc --debug
garbage-clean:
  sudo nix-collect-garbage --delete-old

channel-add:
  bash autoprocess/channel-add.sh
channel-update:
  sudo nix-channel --update
channel-list:
  sudo nix-channel --list

rollback:
  sudo nix-env --rollback

yaksha-update:
  bash autoprocess/yaksha-update.sh

dotfiles:
  bash autoprocess/dots-inst.sh
dotfiels-uninstall:
  bash autoprocess/dots-uninst.sh
