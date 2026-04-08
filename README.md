# feishu-status-reporter

**飞书实时状态汇报 Skill** - 让用户随时看到 AI 的工作过程

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/openclaw/feishu-status-reporter/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![OpenClaw](https://img.shields.io/badge/OpenClaw-Skill-orange.svg)](https://openclaw.ai)

---

## 🌍 Languages

[English](README.md) | [中文](README.zh.md)

---

## 📖 Introduction

A Skill for OpenClaw that enables **real-time status reporting** in Feishu (Lark) and other IM channels, allowing users to see what the AI is doing at all times.

**Problem Solved**:
- Feishu doesn't support tool call cards like the web Control UI
- Users can't see what AI is doing, feels like "no response"
- Long tasks (search, file reading, code execution) lack intermediate feedback

**Core Value**:
- ✅ Real-time status updates
- ✅ Improved user trust
- ✅ Reduced waiting anxiety
- ✅ Transparent AI workflow

---

## 🚀 Quick Start

### Installation

```bash
# Method 1: Install via ClawHub
openclaw skills install feishu-status-reporter

# Method 2: Manual installation
cd /home/z3129119/.openclaw/workspace/skills/
git clone https://github.com/openclaw/feishu-status-reporter.git
```

### Configuration

Add to your `agent.md`:

```markdown
## Status Reporting

**Report status in real-time when**:
1. Before calling tools → Send "🔍 Doing XXX..."
2. After tool completes → Send "✅ XXX done"
3. Multi-step tasks → Report each step
4. Long tasks (>10s) → Send progress updates

**Format**:
- Concise (1-2 lines)
- Use emojis (🔍📖🛠️✅)
- Send in segments (don't wait for completion)
```

---

## 📝 Status Format

### Standard Format

```
🔍 Searching: XXX...
✅ Search complete, found X results

📖 Reading file: XXX.md...
✅ Read complete, XXX lines

🛠️  Calling tool: exec...
✅ Tool execution complete

✍️  Editing file: XXX.md...
✅ Edit complete, X changes

📊 Analyzing data...
✅ Analysis complete

---
(Final response)
```

### Status Icons

| Icon | Meaning | Usage |
|------|---------|-------|
| 🔍 | Searching | web_search, file search |
| 📖 | Reading | read, fetch_doc |
| 🛠️ | Tool Call | exec, browser, tools |
| ✍️ | Writing | write, edit, update_doc |
| 📊 | Analyzing | Data analysis |
| ⏳ | Waiting | Awaiting approval |
| ✅ | Complete | Step done |
| ❌ | Failed | Step failed |
| ⚠️ | Warning | Attention needed |

---

## 📚 Examples

### Example 1: Search Task

**User**: "Check what's new in OpenClaw 4.8"

**AI Status**:
```
🔍 Searching: OpenClaw 4.8 changelog...
✅ GitHub search complete

📖 Reading Release page...
✅ Found 2 version updates

📝 Compiling update content...
✅ Compilation complete

---
## 📦 OpenClaw 4.8 Updates
(Full response)
```

### Example 2: File Operations

**User**: "Help me change 'Yanus' to 'Janus' in MEMORY.md"

**AI Status**:
```
🔍 Searching: Files containing "Yanus"...
✅ Found 3 files

📖 Reading: memory/2026-04-07.md...
✅ Read complete, found 2 occurrences

✍️  Editing: memory/2026-04-07.md...
✅ Edit complete, 2 changes

---
✅ All done! Modified 3 files, 8 occurrences.
```

---

## 🎯 Best Practices

### ✅ Recommended

1. **Report promptly** - Send status before tool calls
2. **Keep it concise** - 1-2 lines, not verbose
3. **Use icons** - Faster visual recognition
4. **Send in segments** - Don't wait for completion
5. **Final summary** - Send complete response at the end

### ❌ Avoid

1. **Over-reporting** - Every tiny step
2. **Too detailed** - Excessive technical details
3. **Too frequent** - Every second
4. **Report without reply** - Forget final result

---

## ⚙️ Advanced Configuration

### Reporting Frequency

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

### Custom Icons

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

## 📊 Before vs After

### Before (No Status Reporting)

```
User: "Check what's new in OpenClaw 4.8"

(Wait 30 seconds...)

AI: "## 📦 OpenClaw 4.8 Updates..."
```

**User Experience**:
- ❌ Don't know what AI is doing
- ❌ Thinks it's stuck
- ❌ May send duplicate messages

### After (With Status Reporting)

```
User: "Check what's new in OpenClaw 4.8"

AI: "🔍 Searching: OpenClaw 4.8 changelog..."
(3s later)
AI: "✅ GitHub search complete"
AI: "📖 Reading Release page..."
(5s later)
AI: "✅ Found 2 version updates"
AI: "📝 Compiling update content..."
(10s later)
AI: "## 📦 OpenClaw 4.8 Updates..."
```

**User Experience**:
- ✅ Clear what AI is doing
- ✅ Sense of progress, less anxiety
- ✅ Improved trust

---

## 📄 License

MIT License

---

## 🔗 Links

- **GitHub**: https://github.com/openclaw/feishu-status-reporter
- **ClawHub**: https://clawhub.ai/skills/feishu-status-reporter
- **OpenClaw**: https://openclaw.ai

---

## 🙏 Credits

Created by 王鲸 AI Team for OpenClaw community.
