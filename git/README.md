# git

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
