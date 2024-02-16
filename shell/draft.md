# 草稿

```sh
ls -al
# -a 参数用于显示所有文件和目录，包括以.开头的隐藏文件和目录。
# -l 参数用于以长格式（详细信息）显示文件和目录的信息，包括权限、拥有者、文件大小、最后修改日期等。


```

```sh
ssh -i /path/to/private_key user@hostname
# -i 参数 (IdentityFile) 指定本机私钥，以便远程主机验证本机的身份。
ssh-keygen -t ed25519 -f "$HOME\.ssh\id_ed25519-remote-ssh"
#-f 参数用于指定生成的密钥文件的名称（文件路径）

#---------------------------------------

ssh-keygen -t ECDSA
# 在本机生成 ECDSA 密钥（公钥和私钥）。
# 私钥通常存储在 ~/.ssh/id_ecdsa
# 公钥通常存储在 ~/.ssh/id_ecdsa.pub

ssh-copy-id username@hostname
# 该命令可将本机公钥添加到目标主机的 ~/.ssh/authorized_keys 文件中。
# 不过 Windows 没有内置该命令，可以选择安装 Cygwin

Get-Content $env:USERPROFILE\.ssh\id_ecdsa.pub | ssh root@xx.xx.xx "cat >> .ssh/authorized_keys"
# 实现与 ssh-copy-id username@hostname 同样的效果。

#-----------------------------------

# The authenticity of host 'xx.xx.xx.xx' can't be established.
# ECDSA key fingerprint is SHA256:qq/xxxxxxxxxxx
# Are you sure you want to continue connecting (yes/no/[fingerprint])?
#
# 选项 [fingerprint]。表示可以选择输入指纹，即指定显示的密钥指纹，以验证服务器的身份。
# 指纹是服务器的一种唯一标识，通过对比指纹，用户可以确保他们正在连接的是正确的服务器，而不是遭遇了中间人攻击。
# 通过 ssh-keyscan -t rsa xxx.xx.xx.xx 可以获取指定主机的 SSH RSA 公钥和指纹
# 通过 ssh-keyscan -t ecdsa xxx.xx.xx.xx 可以获取指定主机的 SSH ECDSA 公钥和指纹
# Windows 10 内置的 OpenSSH 客户端提供了基本的 SSH 客户端和服务器功能，可以自动存储目标主机的指纹。使用方法：ssh username@hostname
# 目标主机的公钥通常存储在 ~/.ssh/known_hosts 中。
# RSA 和 ECDSA 都是常用的非对称加密算法。
# RSA 出现的早，它基于大素数的因子分解问题，安全性取决于密钥的长度（2048位或更长），所以 RSA 签名和加密速度相对较慢
# ECDSA 是基于椭圆曲线离散对数问题的算法，相对较新，但已被广泛采用并被证明是安全的。它提供了与RSA相当的安全性，但使用较短的密钥长度，所以签名和加密速度比 RSA 快。


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
