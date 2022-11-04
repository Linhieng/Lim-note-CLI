## 相关命令说明

下面的命令全部都省略了 `--global`

本地配置在 `.git/config` 中
全局配置在 `~/.gitconfig` 中

```bash

$ git config --list
# 查看配置信息

$ git config --list --show-origin
# 列出所有配置, 并指定来源

$ git config (--edit | -e)
# 编辑配置文件

$ git config user.name
# 查看用户名。

$ git config user.email
# 查看邮箱。

$ git config user.name <username>
# 修改用户名。

$ git config user.email <user-email>
# 修改邮箱。

$ git config http.sslVerify
# Whether to verify the SSL certificate when fetching or pushing over HTTPS.
# Can be overridden by the GIT_SSL_NO_VERIFY environment variable.
# 获取 / 推送 HTTPS 时是否验证 SSL 证书。

$ git config http.sslVerify false
# 禁止使用 SSL 验证。

$ git config init.defaultBranch <NEW_DEFAULT_BRANCH_NAME>
# 修改 git 初始化时的默认分支名，可以通过 cat ~/.gitconfig 查看配置是否成功。

$ git config --unset (http.proxy | https.proxy)
# 取消代理

$ git config (http.proxy | https.proxy) <http-url>
# 配置代理。<http-url> 的示例值： http://127.0.0.1:7890

$ git config core.editor 'vim'
# 将默认编辑器改为 vim

$ git config [--global] --edit
#　打开文件的方式编辑全局配置

$ git config core.editor "code --wait"
# 将默认编辑器修改为 vscode, 如果想要打开新窗口, 可以加上 --new-window 参数

$ git config --unset core.editor
# 重置默认编辑器(重置为 vim)
```