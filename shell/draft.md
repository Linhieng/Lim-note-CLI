# 草稿

```sh
$ find . -type d -name "node_modules" -prune -o -type f -name "playwright.config*"
# 在该目录下查找 playwright.config 开头文件，并忽略 node_modules 文件夹

$ whereis <command>
# 查看某命令所在路径

$ <key>=<value>
# 临时保存环境变量（仅限当前会话）
$ export <key>=<value>
# 长期保存环境变量
```
