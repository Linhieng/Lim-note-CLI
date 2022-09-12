Reset, restore, revert 的区别？

reset 命令可以用来做很多事情，他和 checkout 类似。使用时一定要注意。

## 相关命令说明

```bash

$ git reset --soft HEAD~
# 撤销最近一次 commit, 同时保留该 commit 中的修改内容。

$ git reset --hard HEAD~
# 撤销最近一次 commit, 此命令会丢弃 commit 中的修改内容！
# 一般不使用该命令，很危险！

$ git reset
# 不带任何参数，此命令可以取消 git add 所做的操作。

```