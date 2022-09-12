
## 命令相关说明

```bash

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

$ git branch <new-branch> <place>
# 创建一个新分支。<place> 为新分支位置，它是一个 git 能够识别。

$ git branch (-f | --force) <branch-name> [<start-point>]
# 强制重置本地分支 <branch-name> 的位置为 <start-point>.
# 如果未指定 <start-point>，则 <start-point> 代表 HEAD.

$ git branch (-d | --delete) <branch-name>
# 在删除本地分支。
# 若提示 not fully merged，指的是该分支是“分叉”的，如果删除了，那么该分支的数据就消失了。我们可以先合并该分支，然后再删除该分支就没有问题了，或者使用 -D 强制删除，那么我们就会丢失该分支的数据。

$ git branch (-m | --move) [<old-branch>] <new-branch>
# 修改本地分支名。
# 修改分支名后，后续提交时直接使用新的分支名，旧的远程分支直接删除。

$ git branch (-u | --set-upstream) <remote-name>/<remote-branch> [<branch-name>]
# 指定本地的 <branch-name> 分支追踪远程分支 <remote-name>/<remote-branch>.
# 如果省略 <branch-name>，则 <branch-name> 默认为当前分支名。
# 追踪远程分支后，本地分支名和远程分支名不同时，可以使用 git pull, 但是不能使用 git push.

```