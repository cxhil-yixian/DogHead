#!/bin/bash
# DogVerify.sh

# 詢問檔案路徑
read -p "請輸入要進行驗證的檔案名稱或路徑: " filepath

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
output_file="$(basename "$filepath").hash.txt"

# 詢問檔案路徑
read -p "請輸入要用來驗證的簽名檔名稱或路徑: " sigar_filepath

# 確認簽名檔案存在
if [ ! -f "$sigar_filepath" ]; then
    echo "簽名檔案不存在: $sigar_filepath"
    exit 1
fi

# 讀取簽名檔案內容
sigar_content=$(cat "$sigar_filepath")

# 取得原始簽名
old_hash=$(echo "$sigar_content" | awk '{print $1}')

# 比較雜湊內容
if [ "$hash_value" == "$old_hash" ]; then
    echo "✅ 簽名驗證成功!"
    bash <(curl -sSL https://raw.githubusercontent.com/cxhil-yixian/DogHead/main/DogHead.sh)
else
    echo "❌ 簽名驗證失敗!"
    echo "原始簽名: $old_hash"
    echo "目前雜湊: $hash_value"
    exit 1
fi
