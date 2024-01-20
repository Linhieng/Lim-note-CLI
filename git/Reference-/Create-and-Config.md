# 创建与配置

## `git clone`

```sh
$ git clone <https-url>
# 克隆远程端的一个仓库。

$ git clone [--depth=<number>] <https-url>
# 有时候项目太大，可以进行浅克隆，比如：
# git clone --depth=1 https://github.com/microsoft/TypeScript.git

$ git clone -b <branch-name> <https-url>
# 克隆指定分支，注意分支需要区分大小写。

$ git clone -c http.proxy=<proxy-url> <https-url>
# 使用代理进行克隆。
# <proxy-url> 示例：http.proxy="127.0.0.1:7890"

$ git clone --shallow-since="1 week" <url>
# 克隆最近一周的
# 如果提示 fatal: error processing shallow info: 4，则可能是因为对应日期之后，没有提交内容。

$ git clone --shallow-since="2023-09-06" <url>
# 克隆 2023-09-06 日之后的
```

## [`git config`](https://git-scm.com/docs/git-config/en)

常用语法

```sh
git config <options?> <name?> <value?>
```

常用 `<options>`：

- `--unset`
    - 从配置文件中删除与该键匹配的行。

- `--unset-all`
    - 从配置文件中删除所有匹配该键的行。
    - 比如 `git config --global --unset-all safe.directory` 可以清空 safe.directory 项

- `--global`
    - 全局配置，配置在 `~/.gitconfig` 中

- `--local`
    - 本地配置，配置在当前仓库的 `.git/config` 中

- `--list` / `-l`
    - 查看所有配置项名称，后面不接参数。

- `--edit` / `-e`
    - 直接编辑配置文件。

- `--show-origin`
    - origin 由 来源类型 + 实际来源 组成。

常见 `<name>`：

- `user.name`
- `user.email`
- `init.defaultBranch`
- `http.proxy`
- `https.proxy`
- `core.editor`

案例：

```sh
git config <name>
# 查看某一配置项的值

git config <name> <value>
# 设置或修改某一配置项

git config --global http.proxy http://127.0.0.1:7890
# 配置代理，该 url 为 clash 默认 url

git config --global --unset http.proxy
# 取消代理

git config core.editor 'code'
# 编辑配置文件时，使用 vscode 打开。(要求环境变量有 code.exe)

git config --unset core.editor
# 恢复默认编辑方式 —— vim
```

## `git help`

对于我，更常用的方法是在后面添加 `-h` / `--help` 参数。
