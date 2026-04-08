# feishu-status-reporter

**飞书实时状态汇报 Skill** - 让用户随时看到 AI 的工作过程

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/openclaw/feishu-status-reporter/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-orange.svg)](https://openclaw.ai)

---

## 🌍 语言

[English](README.md) | [中文](README.zh.md)

---

## 📖 简介

一个 OpenClaw Skill，在飞书（Lark）等 IM 渠道中启用**实时状态汇报**，让用户随时看到 AI 在做什么。

**解决问题**：
- 飞书不支持网页版 Control UI 的工具卡片显示
- 用户无法看到 AI 正在做什么，感觉像"没反应"
- 长任务（搜索、文件读取、代码执行）缺少中间状态反馈

**核心价值**：
- ✅ 实时汇报工作状态
- ✅ 提升用户信任感
- ✅ 减少等待焦虑
- ✅ 透明化 AI 工作流程

---

## 🚀 快速开始

### 安装

```bash
# 方法 1：通过 ClawHub 安装
openclaw skills install feishu-status-reporter

# 方法 2：手动安装
cd /home/z3129119/.openclaw/workspace/skills/
git clone https://github.com/openclaw/feishu-status-reporter.git
```

### 配置

添加到你的 `agent.md`：

```markdown
## 状态汇报

**当执行以下操作时，实时汇报状态**：
1. 调用工具前 → 发送"🔍 正在 XXX..."
2. 工具完成后 → 发送"✅ XXX 完成"
3. 多步骤任务 → 每个步骤都汇报
4. 长任务（>10 秒）→ 中间发送进度

**汇报格式**：
- 简洁明了（1-2 行）
- 使用图标（🔍🛠️️✅）
- 分段发送（不要等全部完成）
```

---

## 📝 状态格式

### 标准格式

```
🔍 正在搜索：XXX...
✅ 搜索完成，找到 X 个结果

📖 正在读取文件：XXX.md...
✅ 读取完成，共 XXX 行

🛠️  正在调用工具：exec...
✅ 工具执行完成

✍️  正在编辑文件：XXX.md...
✅ 编辑完成，修改了 X 处

📊 正在分析数据...
✅ 分析完成

---
（最终回复）
```

### 状态图标

| 图标 | 含义 | 使用场景 |
|------|------|---------|
| 🔍 | 搜索中 | web_search、文件搜索 |
| 📖 | 读取中 | read、fetch_doc |
| 🛠️ | 工具调用 | exec、browser、其他工具 |
| ✍️ | 写入中 | write、edit、update_doc |
| 📊 | 分析中 | 数据分析、整理 |
| ⏳ | 等待中 | 等待批准、等待外部 |
| ✅ | 完成 | 步骤完成 |
| ❌ | 失败 | 步骤失败 |
| ⚠️ | 警告 | 需要注意 |

---

## 📚 示例

### 示例 1：搜索任务

**用户**："查一下 OpenClaw 4.8 更新了什么"

**AI 汇报**：
```
🔍 正在搜索：OpenClaw 4.8 更新日志...
✅ GitHub 搜索完成

📖 正在读取 Release 页面...
✅ 找到 2 个版本更新

📝 正在整理更新内容...
✅ 整理完成

---
## 📦 OpenClaw 4.8 更新内容
（完整回复）
```

### 示例 2：文件操作

**用户**："帮我把 MEMORY.md 里的'雅努斯'改成'杰纳斯'"

**AI 汇报**：
```
🔍 正在搜索：包含"雅努斯"的文件...
✅ 找到 3 个文件

📖 正在读取：memory/2026-04-07.md...
✅ 读取完成，发现 2 处

✍️  正在编辑：memory/2026-04-07.md...
✅ 编辑完成，修改了 2 处

---
✅ 全部完成！共修改 3 个文件，8 处内容。
```

---

## 🎯 最佳实践

### ✅ 推荐

1. **及时汇报** - 工具调用前立即发送状态
2. **简洁明了** - 1-2 行，不要冗长
3. **使用图标** - 视觉识别更快
4. **分段发送** - 不要等全部完成
5. **最终汇总** - 所有步骤完成后发送完整回复

### ❌ 避免

1. **过度汇报** - 每个小步骤都汇报
2. **太详细** - 技术细节过多
3. **太频繁** - 每秒都发送
4. **只汇报不回复** - 忘记发送最终结果

---

## ⚙️ 高级配置

### 汇报频率

```json
{
  "statusReporter": {
    "minIntervalSeconds": 5,
    "maxUpdates": 10,
    "skipShortTasks": true,
    "channels": ["feishu"]
  }
}
```

### 自定义图标

```json
{
  "statusIcons": {
    "search": "🔍",
    "read": "📖",
    "write": "✍️",
    "exec": "🛠️",
    "analysis": "📊",
    "complete": "✅",
    "error": "❌"
  }
}
```

---

## 📊 效果对比

### 使用前（无状态汇报）

```
用户："查一下 OpenClaw 4.8 更新了什么"

（等待 30 秒...）

AI："## 📦 OpenClaw 4.8 更新内容..."
```

**用户体验**：
- ❌ 不知道 AI 在做什么
- ❌ 以为卡住了
- ❌ 可能重复发送消息

### 使用后（有状态汇报）

```
用户："查一下 OpenClaw 4.8 更新了什么"

AI："🔍 正在搜索：OpenClaw 4.8 更新日志..."
（3 秒后）
AI："✅ GitHub 搜索完成"
AI："📖 正在读取 Release 页面..."
（5 秒后）
AI："✅ 找到 2 个版本更新"
AI："📝 正在整理更新内容..."
（10 秒后）
AI："## 📦 OpenClaw 4.8 更新内容..."
```

**用户体验**：
- ✅ 清楚知道 AI 在做什么
- ✅ 有进度感，不焦虑
- ✅ 信任感提升

---

## 📄 许可证

MIT License

---

## 🔗 相关链接

- **GitHub**: https://github.com/openclaw/feishu-status-reporter
- **ClawHub**: https://clawhub.ai/skills/feishu-status-reporter
- **OpenClaw**: https://openclaw.ai

---

## 🙏 致谢

由 王鲸 AI 团队为 OpenClaw 社区创建。
