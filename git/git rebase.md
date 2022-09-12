
## 相关命令解释

```bash

$ git rebase -i <place>
# <place> 是 git 能够识别的一个位置。
# -i 参数，能够改变 <place> 到 HEAD 这段历史记录的顺序（不包括 <place> 和 HEAD）。

$ git rebase <branch-name>
# 设：参数中的 <branch-name> 为 br，当前所在分支为 main.
# rebase 就是变基，即将 main 的基变成 br 分支。
# 如果 br 分支是 main 分支的后代，则 rebase 操作和 merge 操作一样，main 分支只是简单的更新到 br.
# 如果 br 分支 和 main 分支内容冲突，则会将 main 作为 br 的一次新的 commit，此时 main 的前一个历史版本(称为父结点)变成了 br。注意 br 还在原地，一般我们还需要再将 br 变基到 main 上。

$ git rebase <base-branch> <change-branch>
# 第一个参数，是作为“基”的存在，第二个参数，是作为“变”的存在。该命令与只有一个参数的 rebase 不同，因为该命令改变的不止一次 commit，而是从 base-branch 和 change-branch 的共同祖先节点算起，到 change-branch，一并变基到 base-branch。


```