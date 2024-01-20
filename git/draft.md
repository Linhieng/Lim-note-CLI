# 草稿

## git 基础内容 - 提交、分支、在提交树上移动、整理提交记录

命令目录：

- [git](./command.md#git)
- [commit](./command.md#commit)
- [branch](./command.md#branch)
- [tag](./command.md#tag)
- [checkout](./command.md#checkout)
- [merge](./command.md#merge)
- [rebase](./command.md#rebase)
- [reset](./command.md#reset)
- [revert](./command.md#revert)

## 概念

### 有关提交 commit 那些事

当我使用中文“提交”的时候，含义是一个名词，表示某次提交；当我使用英文 commit 的时候，表示的是动词，表示的是 git commit 这个动作。一段哈希值、一个分支名、一个标签名、特殊标识符号 HEAD（表示当前位置）等都可用于表示某个特定的提交。通常都会使用 C1 <—— C2 <—— C3 等等来表示某段提交，注意箭头指向的是父节点（旧 <—— 新）。

在操作分支之前，了解一些 HEAD 的概念是非常有帮助的。HEAD 是一个特殊的表示，表示当前位置。他可以指向某段哈希值/标签，或者引用某个分支。可以通过 `cat .git/HEAD` 查看具体的 HEAD 值，或者通过 `git symbolic-ref HEAD` 查看对应的引用（如果有的话）

`reset`, `revert` 需要接收某个提交作为参数，表示回到该提交，其含义是回到该提交所作出的变更并未 commit 的时候。比如 `git revert C2` 表示回到 C2，此时 C1 已经 commit，但 C2 所作出的变更还在等待 commit，此时如果有冲突需要先处理冲突才可以 commit。而 `checkout` 命令也需要接收一个提交作为参数，但它的含义是回到该提交已 commit 的时候，比如 `git checkout C2`，此时 C2 已经 commit，没有任何需要 commit 的变更内容。

当某个提交中的内容和当前位置（HEAD）出现冲突时，常常需要手动合并，此时有以下四种选择：

- 只保留当前位置（HEAD）中的变更内容（Accept Current Change）
- 只保留某个提交中的变更内容（Accept Incoming Change）
- 都保留（Accept Both Changes）
- 自定义，此时需要手动删除一些 git 提供的冲突注释，然后进行编辑。

### 引用（refs）

git 中每次提交的本质是哈希值，但哈希值不方便，于是有了引用。分支、标签、HEAD 其实都是属于一种引用。很多命令都需要我们提供一个 `<commit>` 参数，这个参数表示的其实就是哈希值或引用，通过 `git show-ref` 可查看所有引用。

此外还有相对引用，主要有下面两种：

- `^` 符号表示向上移动一个提交记录。
    - 可以连用多个符号表示向前移动多个提交记录，比如 `HEAD^^`
    - 当上一个提交记录有多个时，可以添加数字，比如 `^2` 表示合并操作时，被合并的提交记录。
- `~<num>` 符号表示向上移动 `<num>` 个提交记录。
    - `~` 可以和 `^` 搭配使用

### 冲突

执行 `merge`, `revert`, `cherry-pick`, `rebase` 等命令时都可能会出现需要手动处理冲突的情况。为方便下面的描述，将执行命令时所在位置称为 head 提交，将出现冲突时所在提交位置称为 target 提交

执行 `git status` 可以查看有冲突的文件（在 Unmerged paths 下）。

- 在解决完冲突文件后，通过 `git add <pathspec>`，标记冲突已被解决，并将所做的更改添加到暂存区。
- 如果解决冲突后，只想将其标记冲突已解决，但并不想将更改添加到暂存区，则使用 `git restore --staged <file>` 命令。
- 如果想直接删除冲突文件，可以执行 `git rm <pathspec>` 命令，它能删除文件，同时标记冲突已被解决，并将所做的更改添加到暂存区。
