
```sh


$ lsof -i:<PORT>
查看谁在使用该端口

$ netstat -ntlp
显示网络状态

$ sudo <SHELL>
以 root 权限执行命令

```

# 下载

```sh
wget http://xxx
yum -y xxx
apt-get


# 列出所有可更新的软件清单命令
apt update
# 安装指定的软件命令
apt install <package-name>
# 安装多个软件包
apt install <package1> <package2> <package3>
# 更新指定的软件命令
apt update <package-name>
# 删除软件包命令
apt remove <package-name>
# 查找软件包命令
apt search <keyword>
# 列出所有已安装的包
apt list --installed
```

```sh

-   ln -snf /etc/wordpress/wp-config.php wp-config.php


```

# systemctl 、firewall 防火墙


```sh
-   systemctl start xxx
-   systemctl restart xxx
-   systemctl status xxx
-   systemctl stop xxx

systemctl stop mysqld.service
# 关闭服务

systemctl start mysqld.service
# 启动服务

systemctl restart mysqld.service
# 重启服务

systemctl status mysqld.service
# 查看服务状态（是否运行）
```

```sh

# firewall

firewall-cmd --zone=public --add-port=3306/tcp --permanent
# 防火墙永久开放 3306 端口

firewall-cmd --reload
# 重新加载防火墙令修改生效

firewall-cmd --list-ports
# 查看已经开放的端口


```bash

$ systemctl start firewalld
启动防火墙

$ systemctl stop firewalld
关闭防火墙

$ systemctl status firewalld
查看防火墙 status

$ firewall-cmd --state
查看防火墙是否在运行

$ firewall-cmd --list-all
可以查看防火墙相关信息

$ firewall-cmd --list-ports
查看开放了哪些端口，如果没有开放该端口，那么外网还是会访问不到

$ firewall-cmd --zone=public --list-ports
查看防火墙开放的端口

$ firewall-cmd --zone=public --add-port=<PORT>/tcp --permanent
永久开发指定端口
$ firewall-cmd --zone=public --remove-port=<PORT>/tcp --permanent
永久移除指定端口

$ firewall-cmd --reload
重新加载防火墙

$ firewall-cmd --list-services
查看防火墙开启的服务
$ firewall-cmd --permanent --add-service=http
永久开启一个 http 服务

$ systemctl is-enabled firewalld
查看 firewalld 是否开启自启
$ systemctl enable firewalld.service
设置 firewalld 开启自启
$ systemctl disable firewalld.service
设置 firewalld 关闭自启

$ firewall-cmd --query-panic
查看是否拒绝所有包
$ firewall-cmd --panic-on
拒接所有包（将会断开连接）
$ firewall-cmd --panic-off
关闭拒接所有包（无法连接时使用 VNC 连接）
```

# grep

```sh
# grep

用于查找文件里符合条件的字符串，一般接在一个命令后面
如 `ps -def | grep "runoob.sh" `

```bash
## arguments 可选的参数：
-a 或 --text : 不要忽略二进制的数据。
-b 或 --byte-offset : 在显示符合样式的那一行之前，标示出该行第一个字符的编号。

-d <动作> 或 --directories=<动作> : 当指定要查找的是目录而非文件时，必须使用这项参数，否则grep指令将回报信息并停止动作。
-e<范本样式> 或 --regexp=<范本样式> : 指定字符串做为查找文件内容的样式。
-E 或 --extended-regexp : 将样式为延伸的正则表达式来使用。
-f<规则文件> 或 --file=<规则文件> : 指定规则文件，其内容含有一个或多个规则样式，让grep查找符合规则条件的文件内容，格式为每行一个规则样式。
-G 或 --basic-regexp : 将样式视为普通的表示法来使用。
-h 或 --no-filename : 在显示符合样式的那一行之前，不标示该行所属的文件名称。
-H 或 --with-filename : 在显示符合样式的那一行之前，表示该行所属的文件名称。
-l 或 --file-with-matches : 列出文件内容符合指定的样式的文件名称。
-L 或 --files-without-match : 列出文件内容不符合指定的样式的文件名称。
-o 或 --only-matching : 只显示匹配PATTERN 部分。
-q 或 --quiet或--silent : 不显示任何信息。
-r 或 --recursive : 此参数的效果和指定"-d recurse"参数相同。
-s 或 --no-messages : 不显示错误信息。
-y : 此参数的效果和指定"-i"参数相同。

```

# 用户、组、权限

```sh

# 切换用户登录
su [username]

# 查看当前登录用户信息
w
# 查看当前用户所属的组
groups
# 查看用户的 uid 信息
id [username]

-   w   查看登录用户
who

who am i
可以查看当前用户名, pts 和登录时间

groups [用户名]
查看当前用户所在组，一个用户可以存在多个组别中

id [用户名]
查看当前用户的 id(uid) 和主分组 id(gid)，还有所在分组 groups
```

# 进程 kill, &, killall, nohup, pgrep

查看进程所在文件夹

```bash
# 查看启动的某一进程
ps -ef | grep [process-name]
# 查看某个进程
top -p [PID]
# 关闭指定的进程
kill [PID]
# 全部进程动态实时视图
top

# df 命令报告文件系统磁盘空间利用率
df -T
# mount 命令是挂载文件系统用的, 不带任何参数运行, 会打印包含文件系统类型在内的磁盘分区的信息
mount


$ ll /proc/PID
在该进程下的文件夹中，就有进程运行所在文件夹的信息
cwd -> /usr/image-hosting-2
cwd 后面的就是程序运行所在文件夹

exe -> /usr/local/node/bin/node
exe 后面代表的是执行程序的文件夹


```



```sh

向进程发送一个关闭信号

$ kill [信号] <PID>

没有指定信号时，是让进制自行关闭，即进程可保存数据后再关闭

指定信号为 -9 或 -SIGKILL ，即让进制立即关闭（会丢失数据）






$ <SHELL> &
后台运行命令 &

$ pgrep <进程名>
查看进程占用的所有 PID

killall apt apt-get


# nohup

no hang up ，不挂起，理解为通过该命令调用的进程，不属于 SSH 控制，即退出 SSH 连接后依然可以运行

在默认情况下（非重定向时），会输出一个名叫 nohup.out 的文件到当前目录下，如果当前目录的 nohup.out 文件不可写，输出重定向到 $HOME/nohup.out 文件中。

```bash

$ nohup <COMMAND> [Arguments] [&]

<COMMAND> 为要执行的命令
Arguments 为可选参数
& 代表后台运行，一般会选上
```

# 案例 - linux 版本

```sh
$ cat /etc/os-release

$ cat /proc/version
查看 linux 内核版本

$ uname -a
查看linux内核版本（可能无此命令）

$ lsb_release -a
列出所有版本信息，适用于所有的Linux发行版

$ cat /etc/redhat-release
列出所有版本信息，只适合Redhat系的Linux

$ cat /etc/issue
列出所有版本信息，适用于所有的Linux发行版
```


# 案例 - Ubuntu 安装 openssh-server

```sh
    sudo apt-get update
    sudo apt-get install openssh-server
    sudo ps -e | grep ssh

    # 此时应该看到有 sshd 服务，还会有一个 ssh-agent
    # 如果没有 ssh ,可以先启动 ssh

    sudo /etc/init.d/ssh start

#安装完后，可以再配置一下文件，允许根用户登录
sudo gedit /etc/ssh/sshd_config
#添加一项内容：
PermitRootLogin yes
#然后保存即可

#最后连接的时候，可以使用
ip a
#命令查看一下系统的 IP 地址

```


# 案例 - 终端窗口之间通信

每个终端窗口，都会在 /dev/pts/ 目录下有对应的伪终端设备文件
`ls /dev/pts`
如果只有一个窗口，则输出 0  ptmx
0 文件夹就是伪终端设备文件

将输出内容输出到对应的伪终端设备文件，则会将内容输出到对应的终端窗口

在第一个终端窗口（0）下执行命令：
`echo "hello" > /dev/pts/1`

此时第二个终端窗口（1）会显示 hello



# 案例 - 更新/卸载 node

```sh
更新 node 版本 / 卸载重装 node

    没用过：
        nodejs如何升级到最新版 n stable
        linux环境升级node版本
        npm cache clean --force
        npm install -g n
        n stable
        n 是管理 nodejs 模块的包

    不小心只升级了 npm，导致提示 npm is known not to run on Node.js v12.4.0
    这样一来，需要重装 node
        找到 node 和 npm 文件夹
            whereis node
            whereis npm
        卸载文件夹
            rm -rf /usr/local/node
        注意此时 npm 和 node 命令还在（为了方便，这里就不修改 /etc/profile 文件了）
            $ node -v
            -bash: /usr/local/node/bin/node: No such file or directory
        下载新的 node 安装包，后面的路径可以从官网查看，注意是 tar.xz 格式的，即 Linux Binaries (x64)
            wget https://nodejs.org/dist/v16.17.0/node-v16.17.0-linux-x64.tar.xz
        解压到 /usr/local/lib/ 文件夹里面
            tar -xvf node-v16.17.0-linux-x64.tar.xz -C /usr/local/lib/
        配置全局环境变量
            echo "export PATH=$PATH:/usr/local/lib/node-v16.17.0-linux-x64/bin" >> /etc/profile
            source /etc/profile
        测试
            $ node -v
                v16.17.0
            $ npm -v
                8.15.0
            $ npx -v
                8.15.0
```





# nginx

```shell
# 更新包缓存
apt update
# 安装 nginx 包
apt instal7 nginx
# 查找 nginx 路径，/etc/nginx 配置文件路径，/usr/sbin/nginx 可执行文件
whereis nginx
# 访问 nginx 部署的默认站点
cur7 http://1ocalhost:80
# 关闭 ng
sudo /usr/sbin/nginx -s stop
# 启动 ng
sudo /usr/sbin/nginx
# 进入 nginx 配置文件夹
cd /etc/nginx
# 打开 nginx 配置文件 nginx.conf，发现默认的站点配置位于 /etc/nginx/sites-enabled
cat nginx.conf
# 进入 sites-enabled 文件夹，并对 default 文件进行配置，修改 80 端口为 8080
cd sites-enabled && vim default
# 重启 nginx 服务
sudo /usr/sbin/nginx -s reload
# 访问 nginx 部署的默认站点
curl http://1ocalhost:8080
```



#  案例 - 在 linux 上部署 github 多个仓库 ssh

[管理部署密钥 - GitHub Docs](https://docs.github.com/zh/authentication/connecting-to-github-with-ssh/managing-deploy-keys#deploy-keys)

服务器配置多个 ssh步骤（下面的 /root/ 等同于 ~/。

1. 生成公私钥配对 ssh-keygen -t rsa
2. 修改私钥文件名 mv /root/.ssh/id_rsa /root/.ssh/rsa__QuestionnaireSystem--server
3. 修改公钥文件名 mv /root/.ssh/id_rsa.pub /root/.ssh/rsa__QuestionnaireSystem--server.pub
4. 修改服务器的 SSH 配置文件 vim /root/.ssh/config
5. 在 github 上的指定仓库中部署公钥（只读） cat /root/.ssh/rsa__QuestionnaireSystem--server.pub
6. 开始克隆 git clone git@github__QuestionnaireSystem--server:Linhieng/QuestionnaireSystem--server.git
7. 现在，可以尽情的 pull 了

服务器的 SSH 配置文件参考如下：

```
Host github__QuestionnaireSystem--server
        Hostname github.com
        IdentityFile=/root/.ssh/rsa__QuestionnaireSystem--server
```

|                                                          |                                                                   |
| -------------------------------------------------------- | ----------------------------------------------------------------- |
| Host github__QuestionnaireSystem--server                 | 这是 ssh 的链接别名，git@github.com: 中 @ 和 : 之间就是链接的别名 |
| Hostname github.com                                      | ssh 链接别名的实际域名                                            |
| IdentityFile=/root/.ssh/rsa__QuestionnaireSystem--server | 此链接使用的私钥地址位置                                          |


# 案例 - 将可执行文件加入全局环境变量中

这个方法是导入文件夹，相当于配置环境变量
```bash
echo "export PATH=$PATH:/usr/mongodb/mongoDB/bin" >> /etc/profile
source /etc/profile
```

这个是将命令的通过软连接的方式链接到 /usr/bin 目录下（ln 命令）
```bash
sudo ln -s /usr/local/go/bin/go /usr/bin/go
```

举例：将 mongod 放入全局环境中

首先，可执行文件 mongod 所在目录 是/usr/mongodb/mongoDB/bin 下

然后直接  `export PATH=$PATH:/usr/mongodb/mongoDB/bin` 就可以将其加入全局环境中，但是这种方式，一旦退出登陆或重新登陆就会失效

想要永远生效，可以将其放入 /etc/profile 中（放入此文件的命令，所有用户均可使用）

使用  `echo "export PATH=$PATH:/usr/mongodb/mongoDB/bin" >> /etc/profile` 将路径添加进配置文件中

然后 `source /etc/profile` 令配置文件生效

输入 `echo $PATH` 可查看全局环境变量，若成功，应该在输出的目录中看见 `:/usr/mongodb/mongoDB/bin` （linux 中是用冒号代表分隔，不是分号）

# 案例 - 开机自动执行脚本

/etc/rc.local 目录

rc.local 理解为一个脚本文件，会在开始时自动执行，只会执行一次，并且执行的时候没有环境变量

通过 `ls -l /etc/rc.local` 可以知道 /etc/rc.local 是 /etc/rc.d/rc.local 的软连接

rc.local 中一般是用来写脚本的，而不是用来启动一些服务的！待商榷

不生效

权限不够

```bash

$ ll /etc/rc.d/rc.local
查看是否有执行的权限（'-x'）

$ chmod +x /etc/rc.d/rc.local
添加执行的权限

```

添加权限后还不生效

```bash
$ echo /etc/rc.local >>/etc/profile &&  source /etc/profile
添加后会看待效果（ /etc/profile　文件会在用户登录时会首先检查并执行）

```
