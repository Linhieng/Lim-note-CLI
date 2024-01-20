# 提交与分支

## add

Add file contents to the index.

```sh
$ git add (-A | --all)
# 更新工作目录（working tree）中所有文件所对应的索引（index）。
# 效果上就是所有变更（changes, 包括 modified, deleted）和新文件（untracked）都被添加到暂存区（temporary staging area）。
```

## mv

Move or rename a file, a directory, or a symlink.

相比普通的 mv 命令，该命令帮我们省略了 add 命令。

## rm

Remove files from the working tree and from the index

```sh
$ git rm --cached <file>..
# 取消对 <file> 的追踪，但不从工作目录中实际删除该文件。

$ git rm -rf *
# （从 index 和working tree 中）删除当前分支中的所有文件
```

## restore

Restore working tree files. Restore specified paths in the working tree with some contents from a restore source.

```sh
git restore <file>...
# 丢弃文件的变更内容。等同于 vscode 中 Source Control 中的 Changes 中的返回符号（Discard Changes）

git restore --staged <file>...
# 将该文件从已归档中移出。等同于 vscode 中 Source Control 中的 Staged Changes 中的减号符号（Unstaged Changes）
```

## commit

Record changes to the repository.

Create a new commit containing the current contents of the index and the given log message describing the changes. The new commit is a direct child of HEAD, usually the tip of the current branch, and the branch is updated to point to it (unless no branch is associated with the working tree, in which case HEAD is "detached")

```sh
$ git commit (-a | --all)
# --all 容易误导人，让人以为它的效果和 git add --all 一样。
# 但实际上 --all 仅仅是将所有变更(modified, deleted)添加暂存区，新创建的文件（untracked）保持不变。

$ git commit -m <msg>
# Use the given <msg> as the commit message.

$ git commit --amend
# Replace the tip of the current branch by creating a new commit.
# 修改最近一次提交的注释内容。

$ git commit --allow-empty
# 创建一个空提交
```

## branch

```sh
$ git branch <new-branch> [<commit> | HEAD]
# 从 <commit> 上创建一个新分支。

$ git branch (-d | --delete) <branch-name>
# 删除本地分支。
# 想要删除云端分支，可以使用 git push origin -d <branch-name>
#                     或 git push origin :<branch-name>


$ git branch (-f | --force) <branch> [<commit> | HEAD]
# 强制将 <branch> 移动到 <commit>。
# 注意，<branch> 不能是当前所在分支。

$ git branch (-u | --set-upstream-to) <upstream> [<branch>]
# set the <branch> to track <upstream>。若省略 <branch>，则默认为当前分支
```

## tag

标签就像是一个锚点，它就像某个提交哈希值的别名一样，不会改变其位置。所以标签通常用于记录某个重要的节点，比如某个大版本的发布或者某次重要的合并操作或者修正某个重要的 bug 等。

```sh
$ git tag
# 列出所有标签。

$ git tag <tag-name> [<commit> | HEAD]
# 给某次提交 <commit> 添加一个标签。

$ git push --tags
# 上传本地所有标签到云端

$ git tag (-d | --delete) <tag-name>
# 删除本地标签。

$ git push origin :refs/tags/<tag-name>
# 删除云端上的标签

$ git describe [<ref> | HEAD]
# 查找距离 <ref> 最近的祖先标签。如果 <ref> 本身就是标签，则只输出对应标签名。否则输出 <tag>_<numCommits>_g<hash>
# <tag> 为标签名。
# <numCommits> 表示 <tag> 与 <ref> 之间相差多少个提交记录
# <hash> 指的是该标签所对应提交记录的前几位哈希值

```

## checkout

`checkout <commit>` 简单的理解就是将当前位置移动到指定提交上。但进一步的理解其实是，检出（或者理解为 check out 借出）某个提交，然后在该提交的基础上继续完成一些工作。

```sh

$ git checkout (-b | -B) <new-branch> <start-point>
# 新建并切换到新分支 <new-branch>，并让它追踪 <start-point>。可用于追踪远程分支。
```

## switch

## 合并策略

默认情况下，git 会自动选择合适的策略，但我们也可以手动指定策略：

```sh
git (merge | rebase | cherry-pick) --strategy=<strategy>
# 可选策略有 octopus ours recursive resolve subtree.
```

- `ours` 策略
    - 舍弃另一条分支所作出的变更，只保留当前分支。
- `recursive` 策略
    - 最常见、最常用策略，同时也是合并有交叉分支时 git 的默认策略
    - 算法描述：递归寻找路径最短的唯一共同祖先节点，然后以其为 base 节点进行递归三向合并。
- FAST-FORWARD MERGE
    - 快速合并策略。在该策略下，将两个处于同一条历史提交树的提交合并时，git 不会创建新的提交记录，而是直接移动到最新的提交上。比如有这么一个历史提交树 c1 <—— c2 <—— c3 ，在 c1 上执行 `git merge c3` 或 `git rebase c3` 时，git 会直接将 c1 移动到 c3 上。
    - `git merge` 时添加 `--no-ff` 参数可以阻止此行为，即强制新建一个提交用于合并。

## merge

## rebase

该命令本质上就是取出一系列的提交记录，“复制”它们，然后在另外一个地方逐个的放下去。效果是能够让历史提交树变得更加简洁清晰。

`rebase` 和 `merge` 的区别就在于：

- `merge` 会保留所有提交纪录，但历史纪录会分叉；
- `rebase` 能够让历史提交树不分叉，但会丢失提交纪录（垃圾回收机制）。

```sh
$ git rebase <newBaseCommit> [<commit> | HEAD]
# 取出 <commit> 上的一系列提交记录，然后“复制”他们，并按顺序依次添加到 <newBaseCommit> 之后。
# 这个一系列提交记录，指的是 <commit> 与 <newBaseCommit> 的最近公共父节点之间的一系列提交记录。
```

如果初次接触 rebase，可以进入[该网站](https://learngitbranching.js.org/?NODEMO)，然后运行以下命令加强对 rebase 的认识

```sh
git switch -c bugfix
git commit
git commit
git switch main
git commit
git commit
git rebase main bugfix # 该命令可拆分为 git switch bugfix 和 git rebase main 两条命令
```

### 交互式 rebase

进入交互出 rebase 模式时，会打开一个 todo 文件，我们可以在文件中书写等待处理的命令。

```sh
$ git rebase (-i | --interactive) <commit>
# 交互式处理 HEAD 到 <commit>（不包含该提交）之间的一系列提交，然后将其放在 <commit> 之后。

$ git rebase --edit-todo
# 打开 todo 文件，编辑剩余的待处理命令
```

初次进入交互式处理时，todo 文件中会按顺序列出 [HEAD, <提交>) 之间的一系列提交，并且每行都属于一条命令，默认是 `pick <command>`。交互式 rebase 本质上就是从上自选按序运行这一系列命令，结果会得到一系列提交的拷贝，这些拷贝将会放在 `<commit>` 之后。所以，我们可以修改这些命令，来实现“交互式 rebase”了。比如更改命令顺序，就相当于更改提交记录的顺序（tips: 在 vim 中按下快捷键 `dd` 可剪切整行，然后按下 `p` 可将整行粘贴到当前行的下面），这类似于 `cherry-pick` 命令，但更加便捷。

一些命令的含义如下：

- `pick <commit>`: use commit。
    - 解释：pick 表示仅仅只是选择该提交，而不会做其他操作（git 也不允许我们做其他操作，除非需要解决冲突）
- `reword <commit>`: use commit, but edit the commit message
    - 解释：reword 同样也是选择该提交，但会停下来修改本次 commit 的注释内容。
- `edit <commit>`: use commit, but stop for amending.
    - amending 表示做一些补充工作，通常是新建几个提交用于补充说明
    - 当补充工作完成时，执行 `git rebase --continue` 继续执行下一条命令
    - 如果需要修改后续的命令，执行 `git rebase --edit-todo` 可再次编辑 todo 文件
- `squash <commit>`: use commit, but meld into previous commit
    - 将该提交直接合并在前一个提交中。但会要求我们重新编写 commit 内容
- `fixup [-c | -C] <commit>`
    - 该命令是 `squash` 的快捷版本，默认（`-c`）只采用前一个记录的 commit 内容。如果指定 `-C` 参数，则只采取当前记录的 commit 内容。
- `drop <commit>`: remove commit
    - 相当于 pick 的反义词，表示不选择该提交。
    - 直接将某行删除也是一样的效果。
- `break`: stop here (continue rebase later with `git rebase --continue`)
    - 自我感觉效果上似乎和 `edit` 命令一样。（但 vscode 似乎没有不认为 break 过程是同样处于 rebasing 状态）

```sh

$ git rebase --continue
# 继续 rebasing 过程，也就是继续执行 todo 文件中的命令。

$ git rebase --skip
# 如果没有冲突，效果上类似于 --continue。
# 如果出现冲突，则该命令会直接丢弃待合并的提交，继续下一条命令。效果上等于 drop

$ git rebase --abort
# 取消本次 rebase 操作
```

## cherry-pick

cherry-pick，精选。该命令用来获得在单个提交中引入的变更，然后尝试将作为一个新的提交引入到你当前分支上。合并变更时，从一个分支上单独挑选一个或两个提交往往比合并整个分支上的所有变更要好得多。

```sh
$ git cherry-pick <commit>...
# 将一系列提交按顺序添加到 HEAD 之后。要求 <commit> 不能是 HEAD 的祖先节点

$ git cherry-pick --skip
# （解决冲突时）跳过本次提交、不选择本次提交

$ git cherry-pick --abort
# 取消本次 cherry-pick 操作
```

## reset

reset 可直接回退到某次提交。支持保留/删除当前位置（HEAD）到所回退的提交之间的所有变更。注意，该命令不同于 revert 和 cherry-pick 等命令，该命令不支持撤回！运行后会丢失回退过程中的所有 commit 注释内容（虽然这些内容相对来说不是特别重要）。

```sh
$ git reset --soft HEAD^
# 回退到上一次提交，即撤销本次的提交，同时保留本次提交的变更内容。

$ git reset --hard HEAD^
# 回退到上一次提交，即撤销本次的提交，同时删除本次提交的变更内容⚠️

$ git reset
# 将已存档(staged changes)中的所有变更内容移出，用英文来表示更加简洁—— Unstage All Changes。
```

## revert

撤销（undo）操作可以使用 `reset` 或 `revert` 命令。 `reset` 所撤销的提交将会消失在历史提交树中，这对于个人项目而言是允许的，但对于团队项目则不然。团队项目中，“撤销”这个动作应该被记录下来，被撤销的提交也应该继续保留，这样别人才知道“哦，这个提交被撤销了”。为此，我们可以使用 `revert` 命令，这也是该命令的目的所在。所以 `revert` 会新建一个提交，只不过该提交所带来的变更恰好是之前的某次提交（效果等同于回退到某次提交）。总的来说，`reset` 命令会直接删除其所撤销的提交记录，而 `reset` 命令则在回退的同时保留其所撤销的提交记录。

```sh

$ git revert --skip
# （解决冲突时）跳过本次提交、不选择本次提交

$ git revert --abort
# 取消本次 revert 操作
```
