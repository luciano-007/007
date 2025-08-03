#!/bin/bash

# 交互式GitHub仓库创建和部署脚本

echo "🚀 GitHub Pages 在线网站部署向导"
echo "================================="
echo ""

# 检查Git配置
if ! git config --global user.name >/dev/null 2>&1; then
    echo "🔧 首次使用Git，需要配置用户信息"
    read -p "请输入你的GitHub用户名: " username
    read -p "请输入你的邮箱地址: " email
    
    git config --global user.name "$username"
    git config --global user.email "$email"
    echo "✅ Git用户信息已配置"
    echo ""
fi

echo "📋 当前项目状态:"
echo "项目路径: $(pwd)"
echo "Git状态: $(git status --porcelain | wc -l) 个未跟踪文件"
echo ""

echo "🎯 下一步操作:"
echo "1. 创建GitHub仓库"
echo "2. 推送代码到GitHub"
echo "3. 启用GitHub Pages"
echo ""

# 创建GitHub仓库的提示
echo "📱 请先在GitHub创建仓库:"
echo "   1. 访问: https://github.com/new"
echo "   2. 仓库名: my-online-website (或你喜欢的名称)"
echo "   3. 选择 Public"
echo "   4. 不要勾选 Initialize with README"
echo "   5. 点击 Create repository"
echo ""

read -p "创建完成后，输入你的GitHub用户名: " github_username
read -p "输入仓库名: " repo_name

# 构建仓库URL
repo_url="https://github.com/$github_username/$repo_name.git"

echo ""
echo "🔗 正在连接到: $repo_url"

# 添加远程仓库
git remote add origin $repo_url 2>/dev/null || git remote set-url origin $repo_url

# 推送代码
echo "📤 正在推送代码..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "🌐 现在启用GitHub Pages:"
    echo "   1. 访问: https://github.com/$github_username/$repo_name/settings/pages"
    echo "   2. 选择 'Deploy from a branch'"
    echo "   3. 分支: main"
    echo "   4. 文件夹: / (root)"
    echo "   5. 点击 Save"
    echo ""
    echo "⏰ 等待2-3分钟后，你的网站将在:"
    echo "   https://$github_username.github.io/$repo_name/"
    echo ""
    echo "🎉 完成！你现在拥有了一个在线可访问的GitHub仓库！"
else
    echo "❌ 推送失败"
    echo "可能的原因:"
    echo "   - 仓库不存在"
    echo "   - 网络连接问题"
    echo "   - 权限问题"
    echo ""
    echo "请检查:"
    echo "   1. 仓库是否已创建"
    echo "   2. 用户名和仓库名是否正确"
    echo "   3. 是否登录了GitHub"
fi