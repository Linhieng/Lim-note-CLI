# 查看 IP 地址

```bash
$ ip addr show
$ ip a
$ hostname -I

$ ifconfig -a
# 需要预安装软件: sudo apt install net-tools
$ curl ifconfig.me
# 获取外网IP. 需要预安装 curl: sudo apt install curl
```


# 案例 - 解决 `service network restart` 时报错

报错信息:
```
Bringing up interface eth0:  Error: No suitable device found: no device found for connection 'System eth0'.
```

搜索到的相关文章
- https://blog.csdn.net/temphy/article/details/77524732
- https://blog.csdn.net/seven_zhao/article/details/43429571
- https://debugah.com/bringing-up-interface-eth0-error-no-suitable-device-found-no-device-found-for-connection-system-eth0-failed-23769/

涉及到的文件有:
- `/etc/udev/rules.d/70-persistent-net.rules`
- `/etc/sysconfig/network-scripts/` 文件夹中的 `ifcfg-eth` 开头的文件

涉及到的命令有
- `ifconfig`
- `uuidgen` 输出一个系统内的唯一标识
- `nmcli con list` 可查看 UUID; 执行失败时试试将 list 换成 show
- `nmcli dev list` 可查看 MAC; 执行失败时试试将 list 换成 show
- `service network restart` 重启

解决:
1. 执行命令 `ifconfig`, 获取正确的 `HWaddr`
2. 用正确的 `HWaddr` 替换 `vim /etc/sysconfig/network-scripts/ifcfg-eth0` 中的 `HWaddr`
3. 再次执行 `service network restart`, 无报错
4. 执行 `ifconfig`, 依旧显示 eth1, 而不是 eth0
5. `rm /etc/udev/rules.d/70-persistent-net.rules`
6. 重启系统, 再次执行 `ifconfig` 成功出现 eth0, 但没有 `ipv4` 地址
7. 等待一下, 再次执行 `ifconfig`, 成功出现 `ipv4` 地址

总结
- `UUID` 只作用于系统内, 确保每个网卡的 `UUID` 唯一即可。通过 `uuidgen` 命令可生成系统内的唯一标识
- `/etc/udev/rules.d/70-persistent-net.rules` 可以删除, 重启系统会自动重新生成
- linux 中一切皆文件, `ifcfg-eth0` 就相当于 `以太网0`
- 使用虚拟机克隆新系统时, 往往会在网卡部分出现问题, 因为 MAC 地址改变了

# 区域设置（编码）

`locale` 可以获取区域相关信息，比如字符编码和时间格式等等。

常用语法：

```syntax
locale [<option>]
```

直接执行 `locale` 会输出和区域有关的变量，比如 `LANG` 变量。该变量表示系统语言使用的字符编码。（（注意 Linux 上环境变量区分大小写）

通过 `locale -m` 或 `locale --charmaps` 可以查看所有可用的编码，比如 ASCII, BIG5, GB2312, GBK, UTF-8 等等。更多配置项可通过 `locale -h` 获取。

Window 上通过 `chcp` 来修改当前终端字符集，而 Linux 上可以通过 `LANG` 变量实现类似的效果。比如 `export LANG=C.gb2312` 可以临时修改字符编码。


# 案例 - 校正系统时间，与网络时间同步

```sh

yum -y install ntp
# 安装ntp校时工具

ntpdate time.nist.gov
# 用ntpdate从时间服务器更新时间
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

## 查看 CPU、内核和逻辑处理器

.查看颗数

grep 'physical id' /proc/cpuinfo | sort -u | wc -l

2.查看核心数量

grep 'core id' /proc/cpuinfo | sort -u | wc -l

3.查看线程数

grep 'processor' /proc/cpuinfo | sort -u | wc -l
