#!/bin/bash

# 定义支持的版本及别名映射
declare -A VERSION_ALIASES=(
  ["latest"]="24.05"
  ["unstable"]="24.11"
  ["preview"]="25.05"
)

SUPPORTED_VERSIONS=("22.11" "23.05" "23.11" "24.05" "24.11" "25.05" "latest" "unstable" "preview")

# 欢迎信息
echo "LingmoNix's Home-manager Initialization Process."
echo "Supported NixOS Version -> ${SUPPORTED_VERSIONS[*]}"

# 让用户选择版本
read -p "Which is the current NixOS Version you are using? (supported latest/unstable/preview):  " user_input

# 检查是否为别名
if [[ -n "${VERSION_ALIASES[$user_input]}" ]]; then
  nixos_version="${VERSION_ALIASES[$user_input]}"
else
  nixos_version="$user_input"
fi

# Check if the version is correct
if [[ ! " ${SUPPORTED_VERSIONS[*]} " =~ " ${nixos_version} " && -z "${VERSION_ALIASES[$user_input]}" ]]; then
  echo "$user_input is a invaild value."
  echo "Aborting..."
  exit 1
fi

# 设置 Home-manager 的 channel URL
home_manager_url="https://github.com/nix-community/home-manager/archive/release-${nixos_version}.tar.gz"

# 添加并更新 Nix 通道
echo "Adding home-manager channel..."
sudo nix-channel --add "$home_manager_url" home-manager
sudo nix-channel --update

# 启用 Home-manager
echo "Installing Home-manager..."
nix-shell '<home-manager>' -A install

# 完成提示
echo "Done for initialization."

