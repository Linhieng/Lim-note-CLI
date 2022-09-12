## 相关命令解释

```bash

$ git merge <branch-name>
# 设：参数中的 <branch-name> 为 br，当前所在分支 为 main.
# merge 就是将 main 与 br 合并。
# 如果 br 分支是 main 分支的后代，则 main 直接更新到 br，此时 merge 操作没有新的 commit.
# 如果这两个分支内容冲突，则需要对这些内容合并，然后提交一个新的 commit，该 commit 包含 main 和 br 两个分支的内容。注意此时 br 还在原来的位置。一般我们还会将 br 也更新到合并后的分支

$ git merge <branch-name> --allow-unrelated-histories
# 允许合并两个不相关（没有共同祖先）的分支

$ git merge -s ours <branch-name>
# 与 <branch-name> 分支合并，但不要它的任何修改内容。这种情况下，就是为了给 <branch-name> 分支 留个备份。

```