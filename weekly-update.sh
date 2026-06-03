#!/bin/bash
# 便當 App 週更新腳本
# 使用方式：在 Claude Code terminal 執行此腳本，
# 然後 Claude 會自動搜尋 Uber Eats 並更新 GitHub。

CLAUDE="/Users/lanceyang/Library/Application Support/Claude/claude-code-vm/2.1.160/claude"
REPO=~/Documents/bento-app

echo "🍱 開始更新便當資料..."
cd "$REPO"

# 用 claude CLI 執行更新任務
"$CLAUDE" --print "
請幫我更新 ~/Documents/bento-app/index.html 的 Uber Eats 便當資料：

1. 使用 Uber Eats 搜尋工具，搜尋地址「研發二路22號 新竹市東區 Taiwan」
   - 搜尋「便當」（葷食，limit 20）
   - 搜尋「素食便當」（素食，limit 10）

2. 挑選：
   - 葷食：評分最高的前 7 家（有菜單資料優先）
   - 素食：評分最高的前 5 家

3. 更新 index.html 裡的 const MEAT = [...] 和 const VEG = [...] 資料

4. git add index.html && git commit -m '🍱 週更新 Uber Eats 便當資料 $(date +%Y-%m-%d)' && git push

完成後告訴我更新了哪些店家。
" 2>&1

echo "✅ 更新完成"
