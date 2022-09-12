## 相关命令解释

```bash

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