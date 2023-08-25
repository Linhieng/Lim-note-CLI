# 仓库贡献指南

目前为止，没有任何要求，或者说具体问题具体分析。总之，你可以在 issue 中提问题，提意见。

## commit 规范

格式要求：

```syntax
<type>[-<scope>]: [<description>]

[<optional body>]
```

说明：

- `<type>`
    - 指明本次 commit 的类型，目前有以下可用值：
        - `init`: 表示开启新的笔记类型，即创建一个新的目录。
        - `add`: 表示添加新的知识点笔记。
        - `update`: 对已有的知识点笔记进行更新说明。
        - `chore`: 无关紧要的内容，比如修改 .vscode 内容、.gitignore 内容。
        - `style`: 没有对内容进行大幅度改动，只对内容进行样式上或者表达逻辑上的修改，或者迁移某些内容到其他文件。
        - `rename`: 重命名文件或者移动文件。
- `<scope>`
    - 更改的范围，比如 `windows`, `shell`。
    - 对于 `add`, `update` 和 `init` 提交类型，要求一定要提供 `<scope>`
- `<description>`
    - 可选，基本的描述信息。
- `<optional body>`
    - 可选，更详细的说明。

案例：

- `add-windows: 如何修改 powershell 命令行提示符`
- `chore: 规定 commit 规范`
