# 🔑 使用Token推送到GitHub

由于GitHub现在使用个人访问令牌(PAT)代替密码认证，请按照以下步骤操作：

## 📋 步骤1：创建GitHub仓库
1. 访问 https://github.com/new
2. 仓库名：`007`
3. 选择 **Public**
4. 不要勾选 "Add README"
5. 点击 **Create repository**

## 📋 步骤2：创建个人访问令牌
1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token (classic)**
3. 设置令牌名称（如：007-token）
4. 选择过期时间（建议选择90天或更长）
5. 勾选以下权限：
   - ✅ repo（完整仓库权限）
   - ✅ workflow（可选，用于GitHub Actions）
6. 点击 **Generate token**
7. **立即复制令牌**（只会显示一次）

## 📋 步骤3：推送代码

### 方法A：使用令牌推送（推荐）
```bash
# 设置远程仓库
git remote add origin https://luciano-007:YOUR_TOKEN@github.com/luciano-007/007.git

# 推送代码
git branch -M main
git push -u origin main
```

### 方法B：使用GitHub CLI（更简单）
```bash
# 安装GitHub CLI
brew install gh

# 登录GitHub
gh auth login

# 推送代码
gh repo create 007 --public --push
```

## 🎯 启用GitHub Pages
1. 进入仓库：https://github.com/luciano-007/007
2. 点击 **Settings**
3. 滚动到 **Pages**
4. 在 **Source** 中选择 **Deploy from a branch**
5. 选择 **main** 分支
6. 点击 **Save**

## 🌐 访问你的网站
等待2-3分钟后，访问：
**https://luciano-007.github.io/007**

## 🆘 遇到问题？
- 令牌无效？重新创建令牌
- 权限问题？确保勾选了repo权限
- 需要帮助？查看 `DEPLOY_GUIDE.md` 获取详细指导