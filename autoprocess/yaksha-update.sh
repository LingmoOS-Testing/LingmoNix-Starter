#!/bin/bash

# 检查源码的版本树
echo "Checking the current version of LingmoNix source..."
cd ~/yaksha || exit
latest_version=$(git log -1 --format=%H)  # 获取最新的版本哈希
current_version=$(cat /path/to/arkimium/yaksha-starter/version_hash)  # 获取当前的版本哈希（如果存在）

if [[ "$latest_version" != "$current_version" ]]; then
  echo "The LingmoNix source tree is not up-to-date. The latest version is: $latest_version"
  echo "Would you like to update the system? (y/n)"
  read answer

  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Updating LingmoNix source code from GitHub..."
    git pull
    echo "The LingmoNix source tree is already up-to-date."
    # 更新版本号文件
    git log -1 --format=%H > ~/yaksha/version_hash
  else
    echo "Update aborted."
    exit 0
  fi
fi
