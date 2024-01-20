# git 命令

## git

## commit

## branch

```sh
$ git branch <new-branch> [<commit> | HEAD]
# 从 <commit> 上创建一个新分支。

$ git branch (-f | --force) <branch> [<commit> | HEAD]
# 强制将 <branch> 移动到 <commit>。
# 注意，<branch> 不能是当前所在分支。

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
```

## checkout

`checkout <commit>` 简单的理解就是将当前位置移动到指定提交上。但进一步的理解其实是，检出（或者理解为 check out 借出）某个提交，然后在该提交的基础上继续完成一些工作。

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

## reset

## revert

```sh

$ git revert --skip
# （解决冲突时）跳过本次提交、不选择本次提交

$ git revert --abort
# 取消本次 revert 操作
```

## cherry-pick

cheery pick, 精选。它能够将任意几个提交添加到 HEAD 后面，只要所选择的提交不是 HEAD 的祖先节点。

```sh

$ git cherry-pick --skip
# （解决冲突时）跳过本次提交、不选择本次提交

$ git cherry-pick --abort
# 取消本次 cherry-pick 操作
```
