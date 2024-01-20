# 撤销和重做

撤销（undo）操作可以使用 `reset` 或 `revert` 命令。 `reset` 所撤销的提交将会消失在历史提交树中，这对于个人项目而言是允许的，但对于团队项目则不然。团队项目中，“撤销”这个动作应该被记录下来，被撤销的提交也应该继续保留，这样别人才知道“哦，这个提交被撤销了”。为此，我们可以使用 `revert` 命令，这也是该命令的目的所在。所以 `revert` 会新建一个提交，只不过该提交所带来的变更恰好是之前的某次提交（效果等同于回退到某次提交）。总的来说，`reset` 命令会直接删除其所撤销的提交记录，而 `reset` 命令则在回退的同时保留其所撤销的提交记录。

## `git reset`

reset 可直接回退到某次提交。支持保留/删除当前位置（HEAD）到所回退的提交之间的所有变更。注意，该命令不同于 revert 和 cherry-pick 等命令，该命令不支持撤回！运行后会丢失回退过程中的所有 commit 注释。

```sh
$ git reset --soft HEAD~
# 撤销最近一次提交, 同时保留变更内容。

$ git reset --hard HEAD~
# 撤销最近一次提交, 同时删除变更内容⚠️

$ git reset
# 将已存档(staged changes)中的所有变更内容移出，用英文来表示更加简洁—— Unstage All Changes。
```

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

## `git restore`

该命令用于丢弃变更内容。

```sh
git restore <file>...
# 丢弃文件的变更内容。等同于 vscode 中 Source Control 中的 Changes 中的返回符号（Discard Changes）

git restore --staged <file>...
# 将该文件从已归档中移出。等同于 vscode 中 Source Control 中的 Staged Changes 中的减号符号（Unstaged Changes）
```

## `git checkout`

checkout，检出，我的理解就是改变当前所在位置（HEAD）。在 [可视化学习 git](https://learngitbranching.js.org) 上面点击某个提交的时候，执行的就是 checkout。
