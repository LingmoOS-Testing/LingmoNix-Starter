#!/bin/bash

# 欢迎信息
echo "Welcome to the NixOS Channel Add Script!"
echo "Please select the region:"
echo "1. global (English)"
echo "2. cn (中文)"

# 获取用户输入
read -p "Please enter the region (1: global, 2: cn): " region

# 英文区域 (global) 逻辑
if [[ "$region" == "1" ]]; then
  # 用户输入版本号
  echo "Please enter the NixOS version (e.g., nixos-19.03 to nixos-unstable):"
  echo "how to enter? -> nixos-(version-number)"
  read -p "Enter version: " version

  # 检查版本是否有效
  if [[ ! "$version" =~ ^nixos-([0-9]+\.[0-9]+|unstable)$ ]]; then
    echo "Invalid version: $version"
    exit 1
  fi

  # 添加 global 通道
  echo "Adding NixOS Channel: https://channels.nixos.org/$version..."
  nix-channel --add "https://channels.nixos.org/$version" "$version"
  nix-channel --update
  echo "NixOS Channel ($version) has been successfully added and updated!"

# 中文区域 (cn) 逻辑
elif [[ "$region" == "2" ]]; then
  echo "请选择镜像站："
  echo "1. TUNA"
  echo "2. USTC"
  echo "3. CERNET"

  # 获取用户选择的镜像站
  read -p "请输入镜像站（1：TUNA，2：USTC，3：CERNET）: " mirror_choice

  # 获取用户输入版本号
  echo "请输入 NixOS 版本号（例如 nixos-22.11 或 nixos-unstable）: "
  read -p "版本号： " version

  # 检查版本是否有效
  if [[ ! "$version" =~ ^nixos-([0-9]+\.[0-9]+|unstable)$ ]]; then
    echo "无效的版本号：$version"
    exit 1
  fi

  # 根据镜像站和平台是否是 Darwin 进行特殊处理
  if [[ "$mirror_choice" == "1" ]]; then
    # TUNA 镜像支持 Darwin，询问是否为 Darwin 平台
    read -p "TUNA镜像添加了 Darwin 平台的支持，请问你是否在 Darwin 平台上运行Nix？(y/n): " is_darwin
    if [[ "$is_darwin" == "y" ]]; then
      # 添加 Darwin 平台的 TUNA 镜像
      echo "正在添加 Darwin 平台的 TUNA 镜像..."
      sudo nix-channel --add "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/$version-darwin" "$version"
    else
      # 添加非 Darwin 平台的 TUNA 镜像
      echo "正在添加 TUNA 镜像..."
      sudo nix-channel --add "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/$version" "$version"
    fi
  elif [[ "$mirror_choice" == "2" ]]; then
    # USTC 镜像
    echo "正在添加 USTC 镜像..."
    sudo nix-channel --add "https://mirrors.ustc.edu.cn/nix-channels/$version" "$version"
  elif [[ "$mirror_choice" == "3" ]]; then
    # CERNET 镜像
    echo "正在添加 CERNET 镜像..."
    sudo nix-channel --add "https://mirrors.cernet.edu.cn/nix-channels/$version" "$version"
  else
    echo "无效的镜像站选择！"
    exit 1
  fi

  # 更新所有的 channels
  sudo nix-channel --update
  echo "NixOS Channel ($version) 添加并更新成功！"

else
  echo "无效的区域选择！"
  exit 1
fi

