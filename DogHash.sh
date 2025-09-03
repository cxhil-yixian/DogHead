#!/bin/bash

# 詢問檔案路徑
read -p "請輸入要進行雜湊的檔案名稱或路徑: " filepath

# 確認檔案存在
if [ ! -f "$filepath" ]; then
    echo "檔案不存在: $filepath"
    exit 1
fi

# 選擇雜湊演算法
echo "請選擇雜湊演算法:"
echo "1) md5sum"
echo "2) sha1sum"
echo "3) sha256sum"
echo "4) sha512sum"
read -p "輸入數字選項 (1-4): " choice

case $choice in
    1) algo="md5sum" ;;
    2) algo="sha1sum" ;;
    3) algo="sha256sum" ;;
    4) algo="sha512sum" ;;
    *) echo "無效選項"; exit 1 ;;
esac

# 產生雜湊
hash_value=$($algo "$filepath" | awk '{print $1}')

# 產生輸出檔案名稱
output_file="Signature.txt"

# 寫入檔案
echo "$hash_value" > "$output_file"

echo "雜湊已產生，輸出檔案為: $output_file"
