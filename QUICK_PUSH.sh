#!/bin/bash

# feishu-status-reporter 快速推送到 GitHub
# 用法：./QUICK_PUSH.sh <org> <repo>

set -e

ORG=${1:-openclaw}
REPO=${2:-feishu-status-reporter}

echo "🚀 推送到 GitHub: ${ORG}/${REPO}"
echo ""

# 检查是否已有 remote
if git remote | grep -q "^origin$"; then
    echo "⚠️  已存在 origin remote，更新 URL..."
    git remote set-url origin https://github.com/${ORG}/${REPO}.git
else
    echo "📍 添加 remote..."
    git remote add origin https://github.com/${ORG}/${REPO}.git
fi

echo ""
echo "📤 推送代码到 GitHub..."
git push -u origin master

echo ""
echo "✅ 推送完成！"
echo ""
echo "📝 下一步："
echo "1. 在 GitHub 创建 Release: https://github.com/${ORG}/${REPO}/releases/new"
echo "   - Tag: v1.0.0"
echo "   - 描述复制 GITHUB_RELEASE.md"
echo ""
echo "2. 发布到 ClawHub（可选）: https://clawhub.ai/publish"
echo ""
echo "🎉 发布成功！"
