# 设置指南 - 创建在线GitHub仓库

## 前提条件

### 1. 安装Git
**macOS用户：**
```bash
# 使用Homebrew安装Git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git

# 或者安装Xcode命令行工具
xcode-select --install
```

**Windows用户：**
- 下载Git for Windows: https://git-scm.com/download/win
- 按照安装向导完成安装

**Linux用户：**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install git

# CentOS/RHEL
sudo yum install git
```

### 2. 创建GitHub账户
1. 访问 https://github.com
2. 点击 "Sign up" 注册新账户
3. 验证邮箱地址

## 快速开始步骤

### 步骤1: 初始化本地仓库
在项目文件夹中打开终端，运行：

```bash
git init
git add .
git commit -m "Initial commit: 创建在线可访问的GitHub项目"
```

### 步骤2: 创建GitHub仓库
1. 登录GitHub.com
2. 点击右上角的 "+" → "New repository"
3. 命名你的仓库（例如：my-online-website）
4. 选择 "Public"（公开）以获得免费的GitHub Pages
5. 不要勾选 "Initialize this repository with a README"
6. 点击 "Create repository"

### 步骤3: 连接并推送
在终端中运行（替换为你的仓库URL）：

```bash
git remote add origin https://github.com/你的用户名/你的仓库名.git
git branch -M main
git push -u origin main
```

### 步骤4: 启用GitHub Pages
1. 进入你的GitHub仓库页面
2. 点击 "Settings" 选项卡
3. 在左侧菜单找到 "Pages"
4. 在 "Source" 下选择 "Deploy from a branch"
5. 选择 "main" 分支和 "/ (root)" 目录
6. 点击 "Save"

### 步骤5: 访问你的网站
等待2-3分钟后，访问：
`https://你的用户名.github.io/你的仓库名/`

## 验证安装

### 检查Git安装
```bash
git --version
```

### 检查Git配置
```bash
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱@example.com"
```

## 故障排除

### 如果推送失败
```bash
# 检查远程仓库
git remote -v

# 如果需要更新远程仓库URL
git remote set-url origin https://github.com/你的用户名/你的仓库名.git

# 强制推送（谨慎使用）
git push -f origin main
```

### 如果GitHub Pages不工作
1. 确认仓库是公开的
2. 确认在Settings → Pages中正确配置了分支
3. 等待最多10分钟让GitHub部署
4. 检查仓库中是否有index.html文件

## 下一步

- 编辑 `index.html` 来自定义你的网站
- 添加更多页面和样式
- 学习更多Git和GitHub功能
- 探索GitHub Actions进行自动化部署

## 有用的链接
- [GitHub Pages官方文档](https://pages.github.com/)
- [Git官方文档](https://git-scm.com/doc)
- [GitHub学习实验室](https://lab.github.com/)