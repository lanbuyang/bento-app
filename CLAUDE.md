# 便當 App — Claude Code 說明

## 週更新指令

當使用者說「更新便當資料」，請執行以下步驟：

### 1. 搜尋 Uber Eats
- 葷食：搜尋「便當」，地址「研發二路22號 新竹市東區 Taiwan」，limit 20
- 素食：搜尋「素食便當」，同地址，limit 10

### 2. 挑選店家
- 葷食：評分最高的前 7 家（優先選有菜單明細的）
- 素食：評分最高的前 5 家

### 3. 更新 index.html
更新 `const MEAT = [...]` 和 `const VEG = [...]` 兩個陣列，格式：
```js
{ name:"店名", icon:"emoji", rating:"4.9", eta:"20", price:"$", promo:"優惠或空字串", veg:false,
  url:"https://www.ubereats.com/store/...",
  menu:[{name:"品項",price:100,key:"key"},...] }
```

### 4. Push 到 GitHub
```bash
cd ~/Documents/bento-app
git add index.html
git commit -m "🍱 週更新 $(date +%Y-%m-%d)"
git remote set-url origin https://lanbuyang:$(gh auth token)@github.com/lanbuyang/bento-app.git
git push
```

## 專案資訊
- GitHub: https://github.com/lanbuyang/bento-app
- 上線網址: https://lanbuyang.github.io/bento-app/
- 配送地址: 新竹市東區科園里研發二路22號（科林研發，戴薇玲）
