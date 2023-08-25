# 收集的命令行

**阅读说明✨：由于该仓库中积累的命令行均为自学，而不是系统的学习，一些过于常见的知识点可能不会记录，一些容易理解的知识点也一带而过，所以外人或者新手阅读起来难免有些困难。如果哪里看不懂，或者找不到相关内容，欢迎创建一个 issue 来询问。**

## 命令行语法项

参考自 [Window 命令行语法项](https://learn.microsoft.com/zh-cn/windows-server/administration/windows-commands/command-line-syntax-key)。

暂时没有统一该规范，也还不确定是否始终使用该规范。因为不同的官方文档，使用的语法还是有些不同的。所以不同的笔记中命令语法可能有些不同。
| 语法表示                   | 说明                                          |
|----------------------------|-----------------------------------------------|
| `两侧不包含任何括号的文本` | 表示该文本不可变                              |
| `<由尖括号包裹的文本>`     | 表示该文本是一个变量，根据需求自定指定对应的值 |
| `[由方括号包裹的文本]`     | 可选项                                        |
| `\|`                        | 可选项                                        |
| `(由括号包裹的文本)`       |                                               |
| `...`                      |                                               |

## 学习资料来源

- 通过命令行的 `/?`, `--help`, `help` 获取知识点。
- 通过官方文档或者学习网站获取知识点，比如：
    - [git 可视化学习网站](https://learngitbranching.js.org/),
    - [npm CLI commands 官方文档](https://docs.npmjs.com/cli/v8/commands)
    - [git 官方文档](https://git-scm.com/docs)
    - [ffmpeg 官方文档](https://ffmpeg.org/ffmpeg.html)
    - [powershell 示例脚本](https://learn.microsoft.com/zh-cn/powershell/scripting/samples/sample-scripts-for-administration?view=powershell-7.3)
    - [cmd 官方文档](https://learn.microsoft.com/zh-cn/windows-server/administration/windows-commands/windows-commands)
- 一些单一的知识点或者简单的知识点会直接通过 Google/Bing 进行查阅。
- 来自“远古”的笔记。

## 仓库根目录下的文件和文件夹说明

```text
|   .gitignore              执行哪些文件会被 git 忽略掉。
|   CODE_OF_CONDUCT.md      社区行为准则。
|   CONTRIBUTING.md         贡献指南。比如当你发现漏洞时，应该发送邮件说明而不是提 issue。
|   LICENSE                 开源协议。
|   README.md               对仓库的基本介绍。
|   SECURITY.md             仓库中的代码安全问题。
|
+---.cspell     这是我的 vscode 中 cspell 插件的配置文件夹
|
+---.github     这是有关 Github 的配置文件夹，比如我的 issue 模版就在其中，此外还可以提供 workflows 等内容。
|
+---.vscode     这是我的 vscode 配置文件夹
|
+---FFmpeg      有关 FFmpeg 的笔记
|
+---Windows     有关 Windows 下的相关命令，如 cmd, powershell
|
+---git         有关 git 命令的笔记（较为久远）
|
+---linux       有关 linux 上的相关命令（较为久远）
|
+---node_cli    有关 npm 的相关命令（较为久远）
|
```
