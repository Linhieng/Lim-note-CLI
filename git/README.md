# git

曾经不熟悉，但现在感觉较为熟悉的命令：`reset`, `revert`, `cherry-pick`, `cherry-pick`。这些命令值得反复品味，最好将中英文档对照着看。

- [基本操作](Reference/Basic-Snapshotting.md)
    - [`git add`](Reference/Basic-Snapshotting.md#git-add)
    - [`git commit`](Reference/Basic-Snapshotting.md#git-commit)
    - [`git status`](Reference/Basic-Snapshotting.md#git-status)
    - [`git rm`](Reference/Basic-Snapshotting.md#git-rm)
    - [`git mv`](Reference/Basic-Snapshotting.md#git-mv)
- [分支和标签](Reference/Branches-and-Tags.md)
    - [`git log`](Reference/Branches-and-Tags.md#git-log)
    - [`git branch`](Reference/Branches-and-Tags.md#git-branch)
    - [`git switch`](Reference/Branches-and-Tags.md#git-switch)
    - [`git checkout`](Reference/Branches-and-Tags.md#git-checkout)
    - [`git merge`](Reference/Branches-and-Tags.md#git-merge)
    - [`git rebase`](Reference/Branches-and-Tags.md#git-rebase)
    - [`git tag`](Reference/Branches-and-Tags.md#git-tag)
    - [`git cherry-pick`](Reference/Branches-and-Tags.md#git-cherry-pick)
    - [`git show-ref`](Reference/Branches-and-Tags.md#git-show-ref)
- [远程与共享](Reference/Remote-and-Share.md)
    - [`git remote`](Reference/Remote-and-Share.md#git-remote)
    - [`git push`](Reference/Remote-and-Share.md#git-push)
    - [`git fetch`](Reference/Remote-and-Share.md#git-fetch)
    - [`git pull`](Reference/Remote-and-Share.md#git-pull)
- [创建和配置](Reference/Create-and-Config.md)
    - [`git init`](Reference/Create-and-Config.md#git-init)
    - [`git clone`](Reference/Create-and-Config.md#git-clone)
    - [`git config`](Reference/Create-and-Config.md#git-config)
- [撤销和重做](Reference/Undo-and-Reset.md)
    - [`git reset`](Reference/Undo-and-Reset.md#git-reset)
    - [`git revert`](Reference/Undo-and-Reset.md#git-revert)
    - [`git restore`](Reference/Undo-and-Reset.md#git-restore)
    - [`git checkout`](Reference/Undo-and-Reset.md#git-checkout)

## 有关提交 commit 那些事

当我使用中文“提交”的时候，含义是一个名词，表示某次提交；当我使用英文 commit 的时候，表示的是动词，表示的是 git commit 这个动作。一段哈希值、一个分支名、一个标签名、特殊变量 HEAD（表示当前位置）等都可用于表示某个特定的提交。通常都会使用 C1 <—— C2 <—— C3 等等来表示某段提交，注意箭头指向的是父节点（旧 <—— 新）。

`reset`, `revert` 需要接收某个提交作为参数，表示回到该提交，其含义是回到该提交所作出的变更并未 commit 的时候。比如 `git revert C2` 表示回到 C2，此时 C1 已经 commit，但 C2 所作出的变更还在等待 commit，此时如果有冲突需要先处理冲突才可以 commit。而 `checkout` 命令也需要接收一个提交作为参数，但它的含义是回到该提交已 commit 的时候，比如 `git checkout C2`，此时 C2 已经 commit，没有任何需要 commit 的变更内容。

当某个提交中的内容和当前位置（HEAD）出现冲突时，常常需要手动合并，此时有以下四种选择：

- 只保留当前位置（HEAD）中的变更内容（Accept Current Change）
- 只保留某个提交中的变更内容（Accept Incoming Change）
- 都保留（Accept Both Changes）
- 自定义，此时需要手动删除一些 git 提供的冲突注释，然后进行编辑。

## `.gitignore` 文件



## 配置系统层次

很多命令都有 `--system`, `--global`, `--local`, , 比如:

```sh
git config [--system | --global | --local] --edit
```

三个参数对应了配置系统的三个层次, 从外到内依次是: system --> global --> local
内部层次的配置优先级比外部的高, 但范围越小。
不写时, 默认是 `--local`

## 相对树引用

git 中可以指定哈希值，来确定指定某一次提交。
但同时，也可以使用相对位置，来指定某一次提交。

### `^` 引用

`^` 符号代表父节点位置，它可以带上数字，不带数字时默认是 1。
比如 `HEAD^` 指的就是当前位置的父节点。

为什么 `^` 后面还需要带数字呢？
因为父节点不一定只有一个，比如 `merge` 操作就有可能导致一次提交纪录有两个父节点。

### `~` 引用

`~` 符号代表祖先节点，它也可以带上数字，不带数字时默认是 1。
比如 `HEAD~` 指的就是当前位置的父节点，它和 `HEAD^` 是等效的。

### 搭配使用

`^` 和 `~` 是可以搭配使用的。比如：

```sh
$ git branch bugWork main^^2~
# 来自 https://learngitbranching.js.org/ 中的 “高级话题” —— “2：两个父节点”。
```
