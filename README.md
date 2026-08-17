# 🎧 Bluetooth Audio Toolkit PRO

<!-- repo-badges:start -->
<p align="center">
  <a href="https://hits.sh/github.com/power0matin/bluetooth-audio-toolkit/"><img src="https://hits.sh/github.com/power0matin/bluetooth-audio-toolkit.svg?style=flat-square&amp;label=Views&amp;labelColor=18181B&amp;color=0EA5E9&amp;logo=github" alt="Repository Views"/></a>
  <a href="https://github.com/power0matin/bluetooth-audio-toolkit/stargazers"><img src="https://img.shields.io/github/stars/power0matin/bluetooth-audio-toolkit?style=flat-square&amp;label=Stars&amp;labelColor=18181B&amp;color=F59E0B&amp;logo=github&amp;logoColor=white" alt="GitHub Stars"/></a>
  <a href="https://github.com/power0matin/bluetooth-audio-toolkit/forks"><img src="https://img.shields.io/github/forks/power0matin/bluetooth-audio-toolkit?style=flat-square&amp;label=Forks&amp;labelColor=18181B&amp;color=6366F1&amp;logo=github&amp;logoColor=white" alt="GitHub Forks"/></a>
  <a href="https://github.com/power0matin/bluetooth-audio-toolkit/issues"><img src="https://img.shields.io/github/issues/power0matin/bluetooth-audio-toolkit?style=flat-square&amp;label=Issues&amp;labelColor=18181B&amp;color=22C55E&amp;logo=github&amp;logoColor=white" alt="GitHub Issues"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/power0matin/bluetooth-audio-toolkit?style=flat-square&amp;label=License&amp;labelColor=18181B&amp;color=EF4444&amp;logo=github&amp;logoColor=white" alt="GitHub License"/></a>
</p>
<!-- repo-badges:end -->

> A Windows-based CLI optimization tool for improving Bluetooth audio quality by tuning system-level codec and profile settings.

Created by **@power0matin**

## 📌 Overview

Bluetooth Audio Toolkit PRO is a lightweight yet powerful Windows batch utility designed to optimize Bluetooth audio performance by modifying system-level Bluetooth audio parameters.

It focuses on improving:

- Audio clarity
- Bitrate stability
- Codec behavior (AAC / SBC)
- Disabling low-quality Hands-Free mode (HFP)

## ⚡ Features

- 🎧 Full audio optimization mode
- 🔊 Enable AAC codec mode
- 🎵 Force SBC fallback mode
- 🔄 System reset to default Bluetooth configuration
- 🧠 Safe registry modification layer
- 📊 Logging system for all operations
- 🖥️ ANSI color UI with fallback support
- 🛡️ Administrator privilege validation
- ⚙️ Zero-crash execution design

## 📷 Preview

```

## Bluetooth Audio Toolkit PRO v1.0.0

[1] Full Optimization (Best Quality)
[2] Enable AAC Only
[3] Force SBC Mode
[4] Reset to Default
[0] Exit

```

## 🚀 Installation

### 1. Clone repository

```bash
git clone https://github.com/power0matin/bluetooth-audio-toolkit.git
```

### 2. Run script

- Right-click `bt_toolkit.bat`
- Select **Run as Administrator**

## ⚙️ How It Works

The tool modifies Windows Bluetooth audio registry keys:

- Disables Hands-Free Profile (HFP)
- Enables AAC codec support (if available)
- Adjusts SBC bitpool for better audio quality

All changes are reversible via Reset option.

## ⚠️ Requirements

- Windows 10 / Windows 11
- Administrator privileges required
- Bluetooth adapter with A2DP support

## 📌 Important Notes

- Disabling HFP will disable microphone over Bluetooth
- For calls, use external microphone or headset mic
- Changes affect system-level Bluetooth behavior

## 🔄 Reset

You can fully revert all changes using:

```
Option 4 → Reset to Default
```

This restores Windows Bluetooth registry settings to default state.

## 🧠 Technical Stack

- Batch scripting (Windows CMD)
- Windows Registry manipulation
- ANSI escape sequence UI
- System-level Bluetooth configuration tuning

## 🛡️ Safety

This tool:

- Does NOT install drivers
- Does NOT collect data
- Does NOT require internet access
- Only modifies local registry keys

All changes are reversible.

## 📜 License

MIT License

## 👤 Author

**@power0matin**

GitHub: [https://github.com/power0matin](https://github.com/power0matin)

## ⭐ Support

If you find this project useful, consider starring ⭐ the repository.
