#!/bin/bash

# 使用Token推送简单网页到GitHub
# 用法: ./push_with_token.sh [用户名] [仓库名] [token]

set -e

# 获取参数
USERNAME=${1:-luciano-007}
REPO=${2:-007}
TOKEN=${3:-}

echo "🔑 使用Token推送到GitHub"
echo "========================="
echo "📋 推送信息:"
echo "用户名: $USERNAME"
echo "仓库名: $REPO"
echo ""

# 检查是否提供了token
if [ -z "$TOKEN" ]; then
    echo "❌ 请提供GitHub个人访问令牌"
    echo ""
    echo "使用方法:"
    echo "./push_with_token.sh $USERNAME $REPO YOUR_TOKEN"
    echo ""
    echo "如何获取token:"
    echo "1. 访问 https://github.com/settings/tokens"
    echo "2. 创建新的个人访问令牌"
    echo "3. 确保勾选 'repo' 权限"
    exit 1
fi

# 检查GitHub仓库是否存在
echo "🔍 检查GitHub仓库..."
if curl -s "https://api.github.com/repos/$USERNAME/$REPO" | grep -q "Not Found"; then
    echo "❌ 仓库不存在，请先创建:"
    echo "访问 https://github.com/new"
    echo "仓库名: $REPO"
    echo "选择 Public"
    echo "不要勾选 README"
    exit 1
fi

# 设置远程仓库
echo "🔗 设置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://$USERNAME:$TOKEN@github.com/$USERNAME/$REPO.git"

# 推送代码
echo "📤 推送代码..."
git branch -M main
git push -u origin main

echo ""
echo "✅ 推送成功！"
echo ""
echo "🎯 启用GitHub Pages:"
echo "1. 访问: https://github.com/$USERNAME/$REPO/settings/pages"
echo "2. 选择 'Deploy from a branch'"
echo "3. 选择 'main' 分支"
echo "4. 点击 'Save'"
echo ""
echo "🌐 等待2-3分钟后访问:"
echo "https://$USERNAME.github.io/$REPO"