# Draft

```sh
$ git rev-parse --abbrev-ref HEAD
# 显示当前 HEAD 所在分支名。
# 如果当前处于 detached HEAD 状态，则只会显示 HEAD
# 如果刚 git init，则显示 HEAD 并报错
# 如果不在 git 仓库中，无输出并报错
$ git rev-parse --short HEAD
# 不在分支上时，显示短 hash

$ git symbolic-ref --short HEAD
# 显示当前 HEAD 所在分支名。
# 如果刚 git init，则显示默认分支名
# 如果当前处于 detached HEAD 状态，则无输出并报错
# 如果不在 git 仓库中，无输出并报错

$ git describe --tags --exact-match HEAD
# 显示当前 HEAD 的标签名，如果没有则报错

$ git branch --show-current
# 显示当前 HEAD 所在分支
# 如果刚 git init，则显示默认分支名
# 如果当前处于 detached HEAD 状态，则无输出
# 如果不在 git 仓库中，无输出并报错

$ git rev-parse --is-inside-work-tree
# 判断当前目录是否在 git 仓库中
```
