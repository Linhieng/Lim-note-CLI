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

## `git switch`

`switch` 命令相对其他命令而言，是较晚出现的命令，它的出现是为了分担 `checkout` 命令的相关功能。

```sh
$ git switch <branch-name>
# 切换分支。
# 若分支不存在，不会自动创建分支。

$ git switch (-c | --create) <new-branch>
# 在当前位置创建一个新的分支名并切换到这个新分支。
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
# 在当前位置创建一个新的孤立分支，并切换到该分支。
# 该分支特殊之处在于，刚创建时，他没有任何历史提交纪录，所以称为 orphan（孤立）。
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

$ git merge <branch-name> --allow-unrelated-histories
# 允许合并两个不相关（没有共同祖先）的分支

$ git merge -s ours <branch-name>
# 与 <branch-name> 分支合并，但不要它的任何修改内容。这种情况下，就是为了给 <branch-name> 分支 留个备份。
```

## `git rebase`

`rebase` 和 `merge` 的区别就在于：`merge` 会保留所有提交纪录，但历史纪录乱；`rebase` 会丢失提交纪录（垃圾回收机制），但历史纪录可以是一条直线。

案例：

```sh
$ git rebase (-i | --interactive) <place>
# https://git-scm.com/docs/git-rebase#:~:text=Make%20a%20list%20of%20the%20commits%20which%20are%20about%20to%20be%20rebased
# 可以对某次提交进行相关操作, 比如修改某次提交的 commit message

$ git rebase <branch-name>
# 设：参数中的 <branch-name> 为 br，当前所在分支为 main.
# rebase 就是变基，即将 main 的基变成 br 分支。
# 如果 br 分支是 main 分支的后代，则 rebase 操作和 merge 操作一样，main 分支只是简单的更新到 br.
# 如果 br 分支 和 main 分支内容冲突，则会将 main 作为 br 的一次新的 commit，此时 main 的前一个历史版本(称为父结点)变成了 br。注意 br 还在原地，一般我们还需要再将 br 变基到 main 上。

$ git rebase <base-branch> <change-branch>
# 第一个参数，是作为“基”的存在，第二个参数，是作为“变”的存在。
# 该命令与只有一个参数的 rebase 不同，因为该命令改变的不止一次 commit，
# 而是从 base-branch 和 change-branch 的共同祖先节点算起，到 change-branch，一并变基到 base-branch。
```

## `git tag`

在 git 中分支是很容易移动的，所以当我们开发完一个可用的版本后，我们不会使用分支来代表该版本，而是使用标签。
比如指定某一版本的标签为 v1，那么后面就可以通过该标签很轻松的定位到对应的版本代码。
标签的命名基本都是版本号，比如 v1.0、v2.0-beta 之类的。

案例：

```sh
$ git tag
# 列出所有标签。

$ git tag <tag-name> [<commit>]
# 给某次提交 <commit> 添加一个标签。
# 如果没有指定 <commit>, 则默认是 HEAD.

$ git tag (-d | --delete) <tag-name>
# 删除标签。

$ git push --tags
# 上传本地所有标签到云端
```
