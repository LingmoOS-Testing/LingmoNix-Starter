#!/bin/bash

echo "Select the dotfile you want to install:"
echo "1. Vim"
echo "2. Neovim (LazyVim)"
echo "3. Neovim (NvChad)"
echo "4. Hyprland"
echo "0. Exit"
read -p "Enter your choice (0-4): " choice

case $choice in
  1)
    echo "Installing Vim dotfiles..."
    # 执行 Vim dotfile 安装命令
    bash vim.sh
    ;;
  2)
    echo "Installing Neovim dotfiles (LazyVim)..."
    # 执行 Neovim (LazyVim) dotfile 安装命令
    bash lazyvim.sh
    ;;
  3)
    echo "Installing Neovim dotfiles (NvChad)..."
    # 执行 Neovim (NvChad) dotfile 安装命令
    bash nvchad.sh
    ;;
  4)
    echo "Installing Hyprland dotfiles..."
    echo "WARNING: PLEASE THINKING TWICE BEFORE INSTALLING HYPRLAND, Uninstall is unsupported yet."
    echo "Installation will be started after 5 secs."
    # 执行 Hyprland dotfile 安装命令
    sleep 5s
    bash hyprland.sh
    ;;
  0)
    echo "Exiting without any action."
    exit 0
    ;;
  *)
    echo "Invalid choice. Please select a number between 0 and 4."
    exit 1
    ;;
esac

