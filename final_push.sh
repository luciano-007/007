#!/bin/bash

# 一键完成GitHub推送
# 用法: ./final_push.sh [用户名] [仓库名]

USERNAME=${1:-luciano-007}
REPO=${2:-007}

echo "🚀 一键推送到GitHub"
echo "=================="
echo "用户名: $USERNAME"
echo "仓库名: $REPO"
echo ""

# 检查是否安装了gh
if ! command -v gh &> /dev/null; then
    echo "📦 安装GitHub CLI..."
    brew install gh
fi

# 检查是否已登录
if ! gh auth status &> /dev/null; then
    echo "🔐 登录GitHub..."
    gh auth login
fi

# 创建仓库并推送
echo "📤 创建仓库并推送代码..."
gh repo create "$REPO" --public --push --source=. --remote=origin

# 启用GitHub Pages
echo "🌐 启用GitHub Pages..."
gh repo edit "$REPO" --enable-pages

echo ""
echo "✅ 完成！"
echo "🌐 访问: https://$USERNAME.github.io/$REPO"
echo "（等待2-3分钟后生效）"