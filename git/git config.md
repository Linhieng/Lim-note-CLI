[git config 官方文档](https://git-scm.com/docs/git-config/zh_HANS-CN)

常用语法：`git config <选项?> <name?> <value?>`

## 🍕 常见案例

```bash
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

## 🍕 常用选项

--unset
&emsp;&emsp;从配置文件中删除与该键匹配的行。

--unset-all
&emsp;&emsp;从配置文件中删除所有匹配该键的行。
&emsp;&emsp;比如 `git config --global --unset-all safe.directory` 可以清空 safe.directory 项

--global
&emsp;&emsp;全局配置，配置在 `~/.gitconfig` 中

--local
&emsp;&emsp;本地配置，配置在当前仓库的 `.git/config` 中

--list, -l
&emsp;&emsp;查看所有配置项名称，后面不接参数。

--edit, -e
&emsp;&emsp;直接编辑配置文件。

--show-origin
&emsp;&emsp;origin 由 来源类型 + 实际来源 组成。

## 🍕 常见 name

- `user.name`
- `user.email`
- `init.defaultBranch` 初始化的默认分支名
- `http.proxy`
- `https.proxy`
- `core.editor`