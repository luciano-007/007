#!/bin/bash

echo "🚀 推送简单网页到GitHub"
echo "========================"

# 检查是否提供了参数
if [ $# -eq 0 ]; then
    echo "使用方法: ./push.sh 你的GitHub用户名 仓库名"
    echo "例如: ./push.sh myusername my-simple-website"
    exit 1
fi

USERNAME=$1
REPO_NAME=$2

# 如果没有提供仓库名，使用默认名称
if [ -z "$REPO_NAME" ]; then
    REPO_NAME="my-simple-website"
fi

REPO_URL="https://github.com/$USERNAME/$REPO_NAME.git"

echo "📋 推送信息:"
echo "用户名: $USERNAME"
echo "仓库名: $REPO_NAME"
echo "URL: $REPO_URL"
echo ""

# 添加远程仓库
echo "🔗 连接到GitHub..."
git remote add origin $REPO_URL 2>/dev/null || git remote set-url origin $REPO_URL

# 推送代码
echo "📤 推送代码..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "🌐 启用GitHub Pages:"
    echo "1. 访问: https://github.com/$USERNAME/$REPO_NAME/settings/pages"
    echo "2. 选择 'Deploy from a branch'"
    echo "3. 选择 'main' 分支和 '/ (root)' 文件夹"
    echo "4. 点击 'Save'"
    echo ""
    echo "⏰ 等待2-3分钟后访问:"
    echo "   https://$USERNAME.github.io/$REPO_NAME/"
else
    echo "❌ 推送失败"
    echo "请确认:"
    echo "1. GitHub仓库已创建"
    echo "2. 用户名和仓库名正确"
    echo "3. 已登录GitHub"
fi