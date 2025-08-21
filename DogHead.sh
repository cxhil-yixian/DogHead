#!/bin/bash
# DogHead.sh

# GitHub 原始檔 URL
README_URL="https://raw.githubusercontent.com/cxhil-yixian/DogHead/main/README.md"

# 下載並輸出 README.md
curl -sSL "$README_URL"

# 提示使用者按任意鍵繼續
echo "按任意鍵繼續..."
read -n 1 -s