# 分支和标签

## `git log`

案例：

```sh
$ git log
# 查看历史纪录。

$ git log --abbrev-commit --pretty=oneline
# --abbrev-commit 参数代表显示短的哈希值，一般是 7 位。
# --pretty=oneline 代表将内容单行显示，超出部分隐藏。

$ git log --graph
# 可以看到提交历史的字符图形表示。

$ git log --stat
#　查看历史 commit 的文件变更情况
```

## `git branch`

案例：

```sh
$ git branch
# 列出所有本地分支。

$ git branch -r
# 列出所有远程分支（不一定是最新的）。

$ git branch -a
# 列出所有本地和远程分支（远程分支不一定是最新的）。

$ git branch -vv
# 列出本地分支。
# 可查阅这些分支所在位置的哈希值(前 6 位)、upstream branch (上游分支)、提交纪录的描述。

$ git branch <branch-name>
# 切换分支。
# 如果该分支不存在，则会创建新分支。


$ git branch (-m | --move) [<old-branch>] <new-branch>
# 修改本地分支名。
# 修改分支名后，后续提交时直接使用新的分支名，旧的远程分支直接删除。

```

## `git switch`

`switch` 命令相对其他命令而言，是较晚出现的命令，它的出现是为了分担 `checkout` 命令的相关功能。

```sh
$ git switch <branch-name>
# 切换分支。
# 若分支不存在，不会自动创建分支。

$ git switch (-c | --create) <new-branch>
# 在当前位置创建一个新的分支名并切换到这个新分支。

$ git switch --orphan <new-branch>
# 创建一个孤立分支并（没有任何历史提交记录），并切换到该分支。
```

## `git checkout`

案例：

```sh
$ git checkout main -- folder
# 将 main 分支上的最新版本的 folder 文件夹的内容恢复到当前工作目录中。
# -- 用于区分命令参数和选项。

$ git checkout .
# 撤销所有的更改, 已经 add 的不会被撤销.

$ git checkout <place>
# 切换到指定位置，<place> 可以是分支名，也可以是哈希值，也可以是相对树引用。
# 若 <place> 是分支名，本地不存在该分支名，但远程仓库上存在该分支名时，则将会创建该分支，并且该分支自动追踪远程仓库上的同名分支。

$ git checkout -b <new-branch> [<start-point>]
# 在 <start-point> 处创建一个新的分支名并切换到这个新分支。
# 若省略 <start-point>，则在 HEAD 处创建新的分支。

$ git checkout -b <new-branch> <remote-name>/<remote-branch>
# 在当前位置创建一个新分支，并且它追踪一个远程分支 <remote-name>/<remote-branch>, 但是该追踪只支持 pull，并不支持 push.

$ git checkout --orphan <new-branch>
# 创建一个孤立分支并，并切换到该分支。
```

## `git merge`

案例：

```sh
$ git checkout main
$ git merge feature
# 切换到 main 分支，然后将 feature 分支的内容合并到当前分支（ main）上

$ git merge <branch-name>
# 设：参数中的 <branch-name> 为 br，当前所在分支 为 main.
# merge 就是将 main 与 br 合并。
# 如果 br 分支是 main 分支的后代，则 main 直接更新到 br，此时 merge 操作没有新的 commit.
# 如果这两个分支内容冲突，则需要对这些内容合并，然后提交一个新的 commit，该 commit 包含 main 和 br 两个分支的内容。注意此时 br 还在原来的位置。一般我们还会将 br 也更新到合并后的分支

$ git merge <branch-name> --no-commit
# 合并没有冲突的两个分支时，默认会自动 commit，添加 --no-commit 可取消该行为。

$ git merge <branch-name> --allow-unrelated-histories
# 允许合并两个不相关（没有共同祖先）的分支

$ git merge -s ours <branch-name>
# 与 <branch-name> 分支合并，但不要它的任何修改内容。这种情况下，就是为了给 <branch-name> 分支 留个备份。

$ git merge <branch-name> --no-ff
# 强制合并处于同一条分支路径上的新分支。默认情况下会直接将该分支移动到新的分支。
```

## git cherry-pick

详细可在 [可视化学习 git](https://learngitbranching.js.org) 上操作对应案例。
