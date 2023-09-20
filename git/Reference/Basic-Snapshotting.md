# 基础操作

## `git add`

语法：

```sh
git add [<options>] [--] <pathspec>...
```

案例：

```sh
$ git add *
# 将所有文件添加到暂存区。

$ git add (-A | --all)
# 将所有文件添加到暂存区。
```

## `git commit`

案例

```sh
$ git commit -a
# 将所有修改添加到暂存区并直接 commit.

$ git commit --amend
# 不追加 commit，而是修改(amend)最近一次 commit.

$ git commit -m <comment>
# commit 时不打开 COMMIT_EDITMSG 进行短说明

$ git commit --allow-empty
# 创建一个空提交
```

## `git status`

案例

```sh
$ git status -s
# 可快速了解工作目录状态，清晰易读。当没有输出时表示没有变更的内容
# A：新增文件到暂存区
# M：修改了已经被追踪的文件
# D：删除了已经被追踪的文件
# ??：未追踪的文件
```

## `git rm`

从当前的工作目录和暂存区中删除文件

案例：

```sh
$ git rm -rf .
# 删除当前分支中的所有文件
```

## `git mv`

相当于想执行 `mv` 命令，然后执行 `git add` 命令
