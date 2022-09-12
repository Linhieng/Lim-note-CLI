
## 相关语法说明

```bash

$ git checkout <place>
# 切换到指定位置，<place> 可以是分支名，也可以是哈希值，也可以是相对树引用。
# 若 <place> 是分支名，本地不存在该分支名，但远程仓库上存在该分支名时，则将会创建该分支，并且该分支自动追踪远程仓库上的同名分支。

$ git checkout -b <new-branch> [<start-point>]
# 在 <start-point> 处创建一个新的分支名并切换到这个新分支。
# 若省略 <start-point>，则在 HEAD 处创建新的分支。

$ git checkout -b <new-branch> <remote-name>/<remote-branch>
# 在当前位置创建一个新分支，并且它追踪一个远程分支 <remote-name>/<remote-branch>, 但是该追踪只支持 pull，并不支持 push.

$ git checkout --orphan <new-branch> 
# 在当前位置创建一个新的孤立分支，并切换到该分支。
# 该分支特殊之处在于，刚创建时，他没有任何历史提交纪录，所以称为 orphan（孤立）。

```