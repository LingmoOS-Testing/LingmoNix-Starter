#!/bin/bash


echo -e "\033[1;33m==> Fully Upgrading System...\033[0m"
./yaksha-update.sh

if [[ $? -ne 0 ]]; then
  echo "Update check failed or update aborted. Maybe the system is latest or the network problems? Exiting upgrade process."
  exit 1
fi

# 将源码复制到 /etc/nixos 目录
sudo cp -r ~/LingmoNix-Starter/* /etc/nixos/

# 执行 nixos-rebuild switch 来应用更改
sudo nixos-rebuild switch

echo "System upgraded to latest!"
echo "ENJOY YOUR SYSTEM, after you reboot it. :)"
