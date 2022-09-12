
理解了 `fetch`、`merge`、`rebase`，`pull` 基本上也没有什么了。
`rebase` 和 `merge` 的区别就在于，`merge` 会保留所有提交纪录，但历史纪录乱；`rebase` 会丢失提交纪录（垃圾回收机制），但历史纪录可以是一条直线。

## 相关命令解释

```bash

$ git pull
# 当前分支有设置追踪时，可以直接使用 git pull 拉取合并。
# 比如 当前 foo 分支 trace(追踪) 

$ git pull --rebase
# git pull 没有带上 --rebase 参数时，执行的是 merge，带上了 rebase，执行的是 rebase.

$ git pull <remote-name> <remote-branch>
# 等同于 git fetch <remote-name> <remote-branch>; git merge <remote-name>/<remote-branch>.
# 比如 git pull origin foo 相当于 git fetch origin foo; git merge origin/foo.
# git pull origin bar~1:bugFix 相当于 git fetch origin bar~1:bugFix; git merge bugFix.


```