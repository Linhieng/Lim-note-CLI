
`switch` 命令是新的命令，是为了分担 `checkout` 命令的相关功能。它的使用还是属于测试阶段，后续可能会有所改变。

## 相关语法

```bash

$ git switch <branch-name>
# 切换分支。
# 若分支不存在，不会自动创建分支。

$ git switch (-c | --create) <new-branch>
# 在当前位置创建一个新的分支名并切换到这个新分支。


```

