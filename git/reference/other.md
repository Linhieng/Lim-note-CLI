# 其他零碎内容

## show-ref

List references in a local repository

## shortlog

```sh
$ git shortlog -sn
# 显示所有提交过的用户，按提交次数排序
```

## blame

```sh
$ git blame <file>
# 显示 <file> 的编辑记录
```

## reflog

```sh
$ git reflog
# 管理 Reference logs。
# 在没有可视化的情况下，可以通过该命令来查看某次提交与 HEAD 的距离
```

## whatchanged

```sh
$ git whatchanged  --oneline <file>
# 查看 <file> 的变更记录
```

## stash

Stash the changes in a dirty working directory away

```sh
$ git stash
# 将当前未提交的变更（包括暂存）移入临时回收站（dirty working directory）
$ git stash pop
# 将临时回收站（dirty working directory）中的内容拿出来
```

## ls-remote

```sh
$ git ls-remote
# List references in a remote repository

$ git ls-remote -q
# Do not print remote URL to stderr.


```

## submodule

```sh

$ git submodule add <git-repo> <folder-name>
# 添加一个子模块
# 添加时，默认会克隆对应子模块，不过当别人从云端克隆该仓库时，是不会自动下载子模块中的内容的。
# 如果想要自动下载子模块内容，可以运行 git clone --recursive <git-repo>
# 或者可以在克隆后的仓库中通过下面两个命令实现同样的效果：
#           git submodule init      先初始化
#           git submodule update    然后更新子模块内容
# 当子模块云端仓库更新时，只需要进入子模块目录，然后 git pull 就可以获取最新的子模块内容了


$ git submodule init
$ git submodule update
```
