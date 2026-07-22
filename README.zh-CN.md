# FloatingClock 悬浮时钟

[English](README.md)

一款轻量、免安装的 Windows 11 x64 悬浮时钟，方便在游戏或全屏应用旁快速查看时间。

![悬浮时钟设置页面](docs/settings.png)

## 功能

- 悬浮显示并始终置顶
- 拖动定位并自动保存位置
- 自定义字体、字号、粗体、文字颜色和背景颜色
- 调整窗口透明度和时间格式
- 锁定位置和鼠标穿透
- 圆角背景和登录后自动启动
- 系统托盘菜单和 `Ctrl+Alt+T` 显示/隐藏快捷键
- 可自由缩放的 Windows 11 风格设置页面
- Per-Monitor V2 高 DPI 支持
- 单文件便携版 EXE

## 系统要求

- Windows 11 x64
- 玩游戏时建议使用无边框窗口或窗口化模式
- 独占全屏游戏可能覆盖普通桌面悬浮窗口

## 从源码构建

标准 Windows 11 系统无需安装 Visual Studio，构建脚本会使用系统自带的 64 位 .NET Framework C# 编译器。

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\build.ps1
```

构建结果位于 `dist\FloatingClock.exe`。

## 使用方法

- 拖动悬浮时钟可以移动位置。
- 右键或双击悬浮时钟打开设置。
- 开启鼠标穿透后，通过系统托盘菜单管理软件。
- 按 `Ctrl+Alt+T` 显示或隐藏悬浮时钟。

设置保存在 `%APPDATA%\FloatingClock\settings.xml`。

## 许可证

本项目使用 [MIT License](LICENSE)。应用图标由 `tools/GenerateIcon.cs` 确定性生成，并使用相同许可证发布。
