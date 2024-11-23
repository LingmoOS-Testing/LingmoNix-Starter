#!/bin/bash

# 打印黄色的提示信息
echo -e "\033[1;33m==> Fully Upgrading System...\033[0m"

# 调用第一个脚本来检查是否需要更新
./update-check.sh

# 检查第一个脚本是否成功执行
if [[ $? -ne 0 ]]; then
  echo "Update check failed or update aborted. Exiting upgrade process."
  exit 1
fi

# 将源码复制到 /etc/nixos 目录
sudo cp -r /path/to/arkimium/yaksha-starter/* /etc/nixos/

# 执行 nixos-rebuild switch 来应用更改
sudo nixos-rebuild switch

echo "System upgraded to latest!"
echo "ENJOY YOUR SYSTEM, after you reboot it. :)"
