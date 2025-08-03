#!/bin/bash

# GitHub Pages一键部署脚本

echo "🚀 GitHub Pages一键部署脚本"
echo "=============================="

# 检查是否提供了GitHub仓库URL
if [ -z "$1" ]; then
    echo "使用方法: ./deploy.sh 你的GitHub仓库URL"
    echo "例如: ./deploy.sh https://github.com/yourusername/my-online-website.git"
    exit 1
fi

REPO_URL=$1
USERNAME=$(echo $REPO_URL | sed 's/.*github.com\///' | sed 's/\/.*//')
REPO_NAME=$(echo $REPO_URL | sed 's/.*\///' | sed 's/\.git//')

echo "📋 部署信息:"
echo "用户名: $USERNAME"
echo "仓库名: $REPO_NAME"
echo "URL: https://$USERNAME.github.io/$REPO_NAME/"
echo ""

# 配置Git用户信息
echo "🔧 配置Git..."
git config user.name "$USERNAME"
git config user.email "$USERNAME@users.noreply.github.com"

# 添加远程仓库
echo "🔗 连接到GitHub..."
git remote add origin $REPO_URL 2>/dev/null || git remote set-url origin $REPO_URL

# 推送到GitHub
echo "📤 推送代码到GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo "🌐 下一步："
    echo "1. 访问 https://github.com/$USERNAME/$REPO_NAME/settings/pages"
    echo "2. 在 'Source' 下选择 'Deploy from a branch'"
    echo "3. 选择 'main' 分支和 '/ (root)' 目录"
    echo "4. 点击 'Save'"
    echo ""
    echo "⏰ 等待2-3分钟后，访问："
    echo "   https://$USERNAME.github.io/$REPO_NAME/"
else
    echo "❌ 推送失败，请检查网络连接和GitHub仓库权限"
fi