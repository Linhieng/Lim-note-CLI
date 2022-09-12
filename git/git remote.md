## 语法相关解释

```bash

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