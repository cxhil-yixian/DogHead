# 狗頭牌簽名

### 簽名
```
bash <(curl -sSL https://raw.githubusercontent.com/cxhil-yixian/DogHead/main/DogHash.sh)
```

### 驗證簽名
```
bash <(curl -sSL https://raw.githubusercontent.com/cxhil-yixian/DogHead/main/DogVerify.sh)
```

### 用法
使用 DogHash.sh 會產生 Signature.txt 簽名檔，主要以內容作為雜湊簽名(非GPG)，此簽名可用於後續對照
使用 DogVerify.sh 會驗證指定檔案的雜湊，與Signature.txt內容是否一致，若一致則表示簽名有效，否則表示簽名無效。
若簽名有效便會顯示【狗頭】