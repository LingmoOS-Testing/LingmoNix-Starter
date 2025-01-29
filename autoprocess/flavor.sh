#!/bin/bash

# Prompt the user to choose language
echo "Please choose the language:"
echo "1. Chinese"
echo "2. English"
read -p "Enter your choice (1/2): " lang_choice

# Set language suffix based on user choice
if [ "$lang_choice" == "1" ]; then
  echo "Chinese selected"
  lang_suffix="-cn"
elif [ "$lang_choice" == "2" ]; then
  echo "English selected"
  lang_suffix=""
else
  echo "Invalid option, exiting."
  exit 1
fi

# Prompt the user to select a configuration
echo "Please choose the configuration to apply:"
echo "1. LingmoNix Studio - for DevOps"
echo "2. LingmoNix Neon - for AI/LLM Training & Services"
echo "3. LingmoNix"
read -p "Enter your choice (1/2/3): " config_choice

# Load the selected configuration file
case $config_choice in
  1)
    config="studio"
    ;;
  2)
    config="neon"
    ;;
  3)
    config="general"
    ;;
  *)
    echo "Invalid option, exiting."
    exit 1
    ;;
esac

# Copy the corresponding configuration file to /etc/nixos
echo "Loading $config configuration..."
cp "configs/$config$lang_suffix/nixos-config.nix" /etc/nixos/configuration.nix

# Prompt the user to edit the configuration
echo "You can now edit the configuration if needed."
nano /etc/nixos/configuration.nix

# Ask the user whether to apply the changes
read -p "Do you want to run 'nixos-rebuild switch' to apply the changes? (y/n): " confirm_switch

# If user confirms, run nixos-rebuild switch
if [ "$confirm_switch" == "y" ]; then
  echo "Running nixos-rebuild switch..."
  sudo nixos-rebuild switch -j 4
  echo "Configuration switched successfully! You can reboot to enjoy the new configuration now!"
else
  echo "Operation canceled."
  exit 0
fi
