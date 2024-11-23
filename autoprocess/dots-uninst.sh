#!/bin/bash

echo "Select the dotfile you want to uninstall:"
echo "1. Vim"
echo "2. Neovim (LazyVim)"
echo "3. Neovim (NvChad)"
echo "4. Hyprland"
echo "0. Exit"
read -p "Enter your choice (0-4): " choice

case $choice in
  1)
    echo "Uninstalling Vim dotfiles..."
    # 执行 Vim dotfile 卸载命令
    bash vim-uninst.sh
    ;;
  2)
    echo "Uninstalling Neovim dotfiles (LazyVim)..."
    # 执行 Neovim (LazyVim) dotfile 卸载命令
    bash lazyvim-uninst.sh
    ;;
  3)
    echo "Uninstalling Neovim dotfiles (NvChad)..."
    # 执行 Neovim (NvChad) dotfile 卸载命令
    bash nvchad-uninst.sh
    ;;
  4)
    echo "Uninstalling Hyprland dotfiles..."
    # 执行 Hyprland dotfile 卸载命令
    echo "Sorry, LingmoNix doesn't know how to uninstall hyprland, so it's unsupported."
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

