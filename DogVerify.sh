#!/bin/bash
# DogVerify.sh

target_file="你的主要檔案.sh"
hash_file="$(basename "$target_file").hash.txt"

# 檢查是否存在簽名檔
if [ ! -f "$hash_file" ]; then
    echo "找不到簽名檔: $hash_file"
    exit 1
fi

# 重新計算雜湊 (這裡假設 DogHash.sh 支援直接傳檔名並輸出 hash)
new_hash=$(./DogHash.sh "$target_file" | tail -n 1)
old_hash=$(cat "$hash_file")

if [ "$new_hash" == "$old_hash" ]; then
    echo "✅ 簽名驗證成功!"
    ./DogHead.sh
else
    echo "❌ 簽名驗證失敗!"
    echo "原始簽名: $old_hash"
    echo "目前雜湊: $new_hash"
    exit 1
fi
