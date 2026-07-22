# 第一次发布到 GitHub：操作指南

## 一、发布前检查

1. 确认仓库中没有密码、令牌、邮箱登录信息、个人路径或其他隐私数据。
2. 确认第三方素材允许公开分发。本项目图标由 `tools/GenerateIcon.cs` 生成，使用 MIT License。
3. 确认程序能够从源码重新构建，并测试 Release 中的 EXE。
4. 不要把 `%APPDATA%\FloatingClock\settings.xml` 上传到仓库，它可能包含你的窗口位置和个人偏好。
5. 不要上传 `.git` 目录中的凭据；本项目的 `.gitignore` 已排除构建产物和常见临时文件。

## 二、创建 GitHub 仓库

1. 登录 GitHub，点击右上角 `+`，选择 `New repository`。
2. Repository name 建议填写 `FloatingClock`。
3. Description 可以填写：
   `A lightweight and customizable floating clock for Windows 11.`
4. 选择 `Public`。
5. 不要勾选 `Add a README file`、`.gitignore` 或 License，因为源码包中已经包含这些文件。
6. 点击 `Create repository`。

仓库创建后可以在 About 区域添加 Topics：`windows`、`clock`、`overlay`、`csharp`、`winforms`、`high-dpi`。

## 三、上传源码

### 方法 A：网页上传（第一次使用最简单）

1. 解压 `FloatingClock-v1.0.0-source.zip`。
2. 在空仓库页面点击 `uploading an existing file`。
3. 将解压后的文件和文件夹拖入页面。
4. 注意网页可能不会接受空目录，但本项目没有依赖空目录。
5. Commit message 填写 `Release FloatingClock v1.0.0`。
6. 点击 `Commit changes`。

网页上传不能保留本地 Git 提交历史和标签。如果希望完整保留历史，使用方法 B。

### 方法 B：Git 命令行上传（推荐）

本地 Git 仓库位于源码目录，或可从 `FloatingClock-v1.0.0.git.bundle` 恢复：

```powershell
git clone FloatingClock-v1.0.0.git.bundle FloatingClock
cd FloatingClock
git remote add origin https://github.com/你的用户名/FloatingClock.git
git push -u origin main
git push origin v1.0.0
```

如果使用已经准备好的本地仓库，只需在仓库目录执行最后三条命令。

GitHub 现在不接受账户密码用于 Git 推送。浏览器弹出登录时使用 Git Credential Manager；或者配置 Personal Access Token / SSH Key。不要把令牌写进源码或聊天记录。

## 四、创建 Release

1. 打开仓库右侧 `Releases`，点击 `Create a new release`。
2. Tag 选择已有的 `v1.0.0`；网页上传源码时可新建同名标签。
3. Release title 填写 `FloatingClock v1.0.0`。
4. 将 `RELEASE_NOTES.md` 的内容粘贴到说明区域。
5. 上传 `FloatingClock-Windows11-x64-v1.0.0.zip`，不要只上传裸 EXE。
6. 勾选 `Set as the latest release`，然后发布。

## 五、需要特别注意

- Windows 可能对未签名 EXE 显示 SmartScreen 提示，这是个人开源项目的常见情况。不要指导用户关闭安全功能；可以在 README 中说明文件未进行商业代码签名，并提供 SHA-256 校验值。
- 发布后下载一次 Release 包，在独立目录解压并运行，避免把本地旧版本误传。
- 公开仓库中的历史很难彻底删除。若不慎提交密钥，仅删除文件不够，应立即撤销并更换密钥。
- MIT License 允许他人使用、修改和再分发代码，同时保留版权与许可声明。
- 建议开启 GitHub 的双重验证，并为账号设置恢复方式。
- 项目出现 Issue 或 Pull Request 后，不要直接运行陌生人提供的二进制文件或脚本，先阅读代码变更。

## 六、后续版本规范

建议使用语义化版本：

- `1.0.1`：Bug 修复
- `1.1.0`：新增兼容功能
- `2.0.0`：有不兼容变化的大版本

Git 标签和 Release 名称建议始终使用带 `v` 的形式，例如 `v1.0.1`。
