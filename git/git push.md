
## 相关语法解释

```bash

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