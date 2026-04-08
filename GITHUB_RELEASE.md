# feishu-status-reporter v1.0.0

**发布日期**: 2026-04-08  
**类型**: 初始发布

---

## 🎉 发布说明

**feishu-status-reporter** 是一个 OpenClaw Skill，用于在飞书（Lark）等 IM 渠道中实时汇报 AI 的工作状态。

---

## ✨ 核心功能

### 实时状态汇报
- 🔍 工具调用前发送状态消息
- ✅ 工具完成后发送完成消息
- 📊 长任务中间发送进度更新
- 📝 使用简洁格式和图标

### 状态图标系统
| 图标 | 含义 |
|------|------|
| 🔍 | 搜索中 |
| 📖 | 读取中 |
| 🛠️ | 工具调用 |
| ✍️ | 写入中 |
| 📊 | 分析中 |
| ✅ | 完成 |
| ❌ | 失败 |

### 配置灵活
- 支持自定义汇报频率
- 可配置启用的渠道
- 支持自定义图标
- 可跳过短任务

---

## 🚀 安装方法

### 方法 1：ClawHub（推荐）
```bash
openclaw skills install feishu-status-reporter
```

### 方法 2：手动安装
```bash
cd /home/z3129119/.openclaw/workspace/skills/
git clone https://github.com/openclaw/feishu-status-reporter.git
```

### 方法 3：下载 ZIP
1. 访问 https://github.com/openclaw/feishu-status-reporter
2. 点击 "Code" → "Download ZIP"
3. 解压到 `skills/` 目录

---

## 📝 配置示例

添加到 `agent.md`：

```markdown
## 状态汇报

**当执行以下操作时，实时汇报状态**：
1. 调用工具前 → 发送"🔍 正在 XXX..."
2. 工具完成后 → 发送"✅ XXX 完成"
3. 多步骤任务 → 每个步骤都汇报
4. 长任务（>10 秒）→ 中间发送进度

**汇报格式**：
- 简洁明了（1-2 行）
- 使用图标（🔍️️✅）
- 分段发送（不要等全部完成）
```

---

## 📊 效果对比

### 使用前
```
用户："查一下 OpenClaw 4.8 更新了什么"
（等待 30 秒...）
AI："## 📦 OpenClaw 4.8 更新内容..."
```

### 使用后
```
用户："查一下 OpenClaw 4.8 更新了什么"
AI："🔍 正在搜索：OpenClaw 4.8 更新日志..."
AI："✅ GitHub 搜索完成"
AI："📖 正在读取 Release 页面..."
AI："✅ 找到 2 个版本更新"
AI："## 📦 OpenClaw 4.8 更新内容..."
```

---

## 🎯 使用场景

### 适合使用
- ✅ 长任务（>10 秒）
- ✅ 复杂任务（多步骤）
- ✅ 用户明确要求实时汇报

### 不适合使用
- ❌ 简单问答（<5 秒）
- ❌ 敏感操作（密码、密钥）

---

## 📚 文档

- **完整文档**: [SKILL.md](SKILL.md)
- **英文 README**: [README.md](README.md)
- **中文 README**: [README.zh.md](README.zh.md)

---

##  致谢

由 王鲸 AI 团队为 OpenClaw 社区创建。

---

## 📄 许可证

MIT License
