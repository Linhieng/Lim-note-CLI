# 草稿

```sh
ssh-keyscan -t rsa xx.xx.xx.xx | ssh-keygen -lv -f -
# https://superuser.com/a/1111974/1834019
# ssh-keyscan 工具用于获取指定 IP 地址的 RSA 密钥。-t rsa 参数指定了密钥类型为 RSA。这个命令的输出是被扫描主机的公钥。
# ssh-keygen 工具来验证从 ssh-keyscan 获取的公钥并显示其详细信息。-lv 参数让 ssh-keygen 显示密钥的详细信息，而不只是密钥指纹。-f - 参数告诉 ssh-keygen 从标准输入中读取密钥。


$ find . -type d -name "node_modules" -prune -o -type f -name "playwright.config*"
# 在该目录下查找 playwright.config 开头文件，并忽略 node_modules 文件夹

$ whereis <command>
# 查看某命令所在路径

$ <key>=<value>
# 临时保存环境变量（仅限当前会话）
$ export <key>=<value>
# 长期保存环境变量
```
