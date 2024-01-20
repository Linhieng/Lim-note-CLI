# 撤销和重做

## `git revert`

该命令本质上是 `git cherry-pick` 的逆操作，用于撤销或者倒转。

```sh
$ git revert <提交>
# 顾名思义，恢复到某次提交。

$ git revert --skip
# 在 revert 过程中，跳过本次 commit

$ git revert --abort
# 取消 git revert 操作，回到执行 git revert 之前。
```

## `git checkout`

checkout，检出，我的理解就是改变当前所在位置（HEAD）。在 [可视化学习 git](https://learngitbranching.js.org) 上面点击某个提交的时候，执行的就是 checkout。
