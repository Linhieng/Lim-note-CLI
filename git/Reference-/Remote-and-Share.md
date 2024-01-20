# 远程共享

## `git remote`

案例：

```sh
$ git remote show
# 查看所有保存的远程仓库别名。

$ git remote -v
# 查看保存的远程仓库别名和值。

$ git remote add <remote-name> <https-url>
# 增加远程仓库。

$ git remote rm <REMOTE_NAME>
# 删除远程仓库。

$ git remote rename <old> <new>
# 对远程库别名重命名。

$ git remote set-head origin -a
# 出现 origin/HEAD 符号引用

$ git remote set-head origin -d
# 删除 origin/HEAD 符号引用
```

## `git push`

语法：

```sh
git push [<options>] [<repository> [<refspec>...]]
```

说明：

- `<options>`: 我用过的配置项有以下这些
    - `--tags`
    - `-f` / `--force`
    - `-u` / `--set-upstream`
        - 将当前分支与指定的远程仓库和分支建立起追踪关系，此外在该分支上可以直接使用简写命令 `git push` 进行推送。

- `<repository>`: 可以是仓库别名，比如 `origin`，也可以是一个完整 URL 路径

- `<refspec>`: 表示**可提交对象的引用**（比如分支名），格式为 `<source>:<destination>`
    - `<source>` 是本地分支名称
    - `<destination>` 是远程分支名称
    - 当本地分支和远程分支名称相同时，可简写

案例：

```sh
git push --all origin
# 将本地所有分支同时推送到云端

$ git push
# 这是简写模式，如果仓库是新建的，该模式是不生效的，须使用过 -u 才可以使用该简写命令。
# 这种只适用于本地分支名和远程分支名相同的。如果想将本地 a 分支推送到远程 main 分支，不能使用该简写模式。比如： git push -u origin new:master 生效后，使用 git push 还是会无效。

$ git push --force-with-lease
# 比 --force 更安全的强制推送：如果推送时，有其他人推送了新的提交，则此次推送会被拒接，需要先 fetch

$ git push --tags
# 上传本地所有标签。这个命令也是属于简写，就不再多说明了。

$ git push <remote-name> <branch-name>
# 将本地分支 <branch-name> 提交到远程仓库 <remote-name> 上。
# 注意，该命令默认了远程仓库分支名和 <branch-name> 相同，如果远程仓库不存在该分支，则会创建该分支。

$ git push <remote-name> <source>:<destination>
# <source> 代表一个本地 git 能够检索到的位置，比如 main 或 main^ 或 main~3.
# <destination> 代表一个远程 git 能够检索到的位置，和 <source> 类似，只不过他是代表远程仓库上的。
# 该命令能够将 <source> 推送到 <destination>.
# 如果远程仓库上不存在该分支，则会创建该分支。

$ git push (-u | --set-upstream) <remote-name> <branch-name>
# 命令基本等同于 git push <remote-name> <branch-name>.
# 首次提交时一般会带上 -u 参数，作用是“跟踪上游分支”。

$ git push <remote-name> :<branch-name>
# 该命令是 git push <remote-name> <source>:<destination> 中的 <source> 为空时的特殊形式。
# 该命令的效果等同于删除远程仓库上的分支。

$ git push <remote-name> (-d | --delete) <branch-name>
# 删除远程分支。

$ git push <remote-name> :refs/tags/<tag-name>
# 删除远程标签

$ git push <remote-name> :<tag-name>
# 删除远程标签
```

## `git fetch`

```sh
$ git fetch
# 拉取远程仓库所有分支最新的提交纪录。更新本地所有远程分支。

$ git fetch (-p | --prune)
# 更新远程分支列表。

$ git fetch <remote-name> <remote-branch>
# 下载远程仓库中 <remote-branch> 分支最新的提交纪录，并更新本地仓库中的远程分支。

$ git fetch <remote-name> <source>:<destination>
# <source> 代表一个远程 git 能够检索到的位置，比如 main 或 main^ 或 main~3.
# <destination> 代表一个本地 git 能够检索到的位置。
# 该命令能够将 <source> 拉取到 <destination>.
```

## `git pull`

理解了 `fetch`、`merge`、`rebase` 命令，那么 `pull` 就很简单了。

案例：

```sh
$ git pull
# 当前分支有设置追踪时，可以直接使用 git pull 拉取合并。
# 比如 当前 foo 分支 trace(追踪)

$ git pull --rebase
# git pull 没有带上 --rebase 参数时，执行的是 merge，带上了 rebase，执行的是 rebase.

$ git pull <remote-name> <remote-branch>
# 等同于 git fetch <remote-name> <remote-branch>; git merge <remote-name>/<remote-branch>.
# 比如 git pull origin foo 相当于 git fetch origin foo; git merge origin/foo.
# git pull origin bar~1:bugFix 相当于 git fetch origin bar~1:bugFix; git merge bugFix.
```
