# 检查历史和状态

## bisect

## diff

## grep

## log

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

## show

## status

Show the working tree status

Displays paths that have differences between the index file and the current HEAD commit, paths that have differences between the working tree and the index file, and paths in the working tree that are not tracked by Git (and are not ignored by gitignore).

```sh
$ git status (-s | --short)
# 以简短的形式给出输出。当没有输出时表示没有变更的内容。
# [??] 表示未被追踪
# [!!] 表示被忽略，需要提供 --ignored 才会显示被忽略的文件
# [A ] 表示该文件是新建的，并且已被追踪（added to index）
# [ M] 表示该文件被修改，但还未添加仅暂存区（no updated in index）
# [ D] 表示该文件被删除，但还未添加仅暂存区（no updated in index）
```
