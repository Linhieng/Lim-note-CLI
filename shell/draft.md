# 草稿

## 用户权限

sudo 全称  superuser do

su 全称 substitute users

组代表的仅仅只是一系列用户的集合。所以当你创建一个新用户时，你会发现 `/etc/group` 中也会多出一个组。

```sh
sudo cat /etc/sudoers
# 并不是每个用户都有 sudo 权限的
# 不同用户的 sudo 权限所拥有的权限也是不同的
# 这就是这个文件的作用，但通常是在 /etc/sudoers.d 文件中编辑，而不是直接在 /etc/sudoers 中编辑

sudo cat /etc/passwd | column -t -s ':'
# root:x:0:0:root:/root:/bin/bash

sudo cat /etc/shadow | column -t -s ':'
# root:*:19752:0:99999:7:::

sudo cat /etc/group | column -t -s ':'
# root:x:0:

sudo useradd alan
# 添加用户
sudo userdel alan
# 删除用户
sudo passwd alan
# 设置/修改特定用户密码

passwd
# 设置/修改当前用户密码
```

`/etc/passwd` 以 colon 分割，从左到右依次是：
  - Username
  - User's password.
    - ` ` 空白表示没有设置密码。
    - `x` 表示密码存储在 /etc/shadow file
    - `*` 表示该用户没有登录权限
  - User ID (UID)
  - Group ID (GID)
  - GECOS field 备注信息，比如联系方式。使用逗号分割。
  - User's home directory
  - User's shell. 通常都是 bash


`/etc/shadow` 以 colon 分割，从左到右依次是：
  - Username
  - Encrypted password 加密后的密码，*
  - Date of last password changed 为 0 表示用户登录时需要修改密码。
  - Minimum password age 表示密码最短寿命，至少超过这个时间后才可以再次修改密码
  - Maximum password age 表示密码的最长寿命，超过这个时间后必须修改密码。
  - Password warning period 表示密码即将过期前多少天给出警告信息
  - Password inactivity period 表示密码过期后，还允许登录的时间期限
  - Account expiration date 表示超过这个日期后用户将无法登录
  - Reserved field for future use 保留字段

`/etc/group` 以 colon 分割，从左到右依次是：
  - Group name
  - Group password 组并不需要密码，默认设置为 *
  - Group ID (GID)
  - List of users



### cat /etc/group

```sh
{ echo "Name:Password:ID:Members"; cat /etc/group; } | column -t -s ':'
```

- 组名（Group Name）
    ： 这一列包含了组的名称，即组的标识符。
- 组密码（Group Password）
    ： 这一列通常包含一个加密的组密码。在许多 Linux 系统中，这个字段通常被设置为空，或者包含一个占位符（如 x），而实际的密码信息则存储在 /etc/gshadow 文件中。
- 组ID（Group ID）
    ： 这一列包含了组的唯一标识符，称为组ID（GID）。每个组都有一个唯一的GID，在系统中用于标识组。
- 组成员（Group Members）
    ： 这一列包含了属于该组的用户列表。用户之间用逗号分隔，表示他们是该组的成员。

### cat /etc/passwd

```sh
cat /etc/passwd | column -t -s ':'
# 好看点

{ echo "Username:Password:UID:GID:User Description:Home Directory:Login Shell"; cat /etc/passwd; } | column -t -s ':'
# 添加表头
```
- 用户名（User Name）
    ： 这一列包含了用户的登录名。当用户登录系统时，会使用该用户名进行身份验证。
- 密码（Password）
    ： 这一列存储了用户的加密密码或密码占位符。在过去，/etc/passwd 文件中存储着用户的密码，但现在通常用一个占位符来表示密码被加密存储在 /etc/shadow 文件中。
- 用户ID（User ID）
    ： 这一列存储了用户的唯一标识符，称为用户ID（UID）。每个用户都有一个唯一的UID，用于在系统中标识用户。
- 组ID（Group ID）
    ： 这一列存储了用户所属的组的唯一标识符，称为组ID（GID）。每个用户都至少属于一个组，该组通常是用户的主组。
- 用户描述信息（User Description）
    ： 这一列存储了用户的描述信息，通常是用户的全名或注释。这个字段可以包含任意文本，但通常包含用户的真实姓名或其他相关信息。
- 家目录路径（Home Directory）
    ： 这一列存储了用户的家目录的路径。家目录是用户登录后默认进入的目录，通常包含用户的个人文件和配置信息。
- 默认 shell（Login Shell）
    ： 这一列存储了用户登录后默认使用的 shell 的路径。shell 是用户与操作系统交互的界面，它解释和执行用户输入的命令。


## 权限

`d | rwx | r-x | r-x ` 文件权限格式说明，从左到右依次是：

- filetype 文件类型，
  - `d` 表示目录。
  - `-` 表示一般文件
- user permissions 用户权限
- group permissions 组权限
- other permissions 其他用户/组权限

rwx- 分别表示可读、可写、可执行文件、无权限/非可执行文件。

```sh
$ ls -l
# 显示详细信息，第一个字段就是文件权限信息

$ chmod ugo+rwx <file>
$ chmod ugo-rwx <file>
$ chmod u+r <file>
$ chmod g+r <file>
# u 表示用户
# g 表示组
# o 表示其他
# + 表示添加权限
# - 表示移除权限

# 4 (100) r
# 2 (010) w
# 1 (001) x
# 0 (000) -
# 100 100 100 表示 r-- | r-- | r--
# 010 010 010 表示 -w- | -w- | -w-
# 001 001 001 表示 --x | --x | --x
# 101 101 101 表示 r-x | r-x | r-x
# 111 111 111 表示 rwx | rwx | rwx
# ...
# 所以
$ chmod 777 <file> # chmod ugo+rwx <file>
$ chmod 000 <file> # chmod ugo-rwx <file>
$ chmod 444 <file>
$ chmod 222 <file>
$ chmod 111 <file>
$ chmod 755 <file>
$ chmod 700 <file>
```

修改所有权（Ownership Permissions）

```sh
$ sudo chown user <file>
# Modify user ownership

$ sudo chgrp group <file>
# Modify group ownership

$ sudo chown user:group <file>
# Modify both user and group ownership at the same time


umask 022
umask 777 # 取走所有权限
umask 000 # 不取走权限，x 不是权限，所以默认是 -
# 配置创建文件/文件夹时的默认权限
# 数值表示拿走哪些权限，比如 022 表示不取走 user 的权限，
# 但对于 group 和 other，要取走他们的 w 权限。
```

---

Setuid 是一种文件系统属性，它允许一个程序在执行时以文件所有者的权限来运行，而不是以执行程序的用户的权限来运行。Setuid 是 Set User ID 的缩写，意味着它会在执行时设置程序的有效用户 ID 为文件所有者的用户 ID。

通常情况下，当用户执行一个程序时，该程序以当前用户的权限来执行。但是，当设置了 Setuid 属性的程序被执行时，它会以文件所有者的权限来执行，即使执行程序的用户不是文件的所有者。

```sh
# 当我们使用 passwd 命令时，它实际上是会修改 /etc/passwd 的
# 但这个文件不应该是管理员所有吗？为什么我们能修改呢？

$ ls -l /etc/passwd
-rw-r--r-- 1 root root 965 Feb  6 19:36 /etc/passwd

# 原因在于 passwd 命令
$ ls -l /usr/bin/passwd
-rwsr-xr-x 1 root root 63960 Feb  7  2020 /usr/bin/passwd

# 可以看到文件权限中多了个 s 符号，这表示在执行 passwd 命令时，
# 将已文件所有者的权限执行。该文件的所有者是 root，所以我们可以修改 /etc/passwd 文件

chmod u+s <file>
chmod 4755 <file>
# 4 表示 setuid
```

类似的，还有 setgid (set group ID, SGID)，它允许用户已文件所属组的权限运行。

```sh
ls -l /usr/bin/wall
-rwxr-sr-x 1 root tty 35048 Jan 20  2022 /usr/bin/wall

chmod g+s <file>
chmod 2555 <file>
# 2 表示 set group id
```

此外还有 t 标识，它表示 The Sticky Bit，意为只有文件所有者，或者 root 用户才能删除或修改文件。

```sh
$ ls -ld /tmp
drwxrwxrwt 1 root root 12288 Mar 17 04:46 /tmp

# 可以看到 /tmp 文件夹，任何用户都可以添加文件、写入文件，但不能删除文件（除了 root 用户）

$ chmod +t <file>

$ chmod 1755 <file>
# 1 表示 t
```


注意，能给运行带有 s 标志的 root 用户的进程，并不意味你临时拥有了 root 权限。

linux 中有很多 uid，其中和进程权限相关的，有三种：

- effective user ID 有效用户 id。它授予了进程执行时的权限。比如 alan 用户运行 passwd 命令（程序）时，它的有效用户 id 就是 alan。噢，等等，由于 passwd 设置了 s 标志，所以它的有效用户 id 应该是 passwd 文件的拥有者，也就是 root 用户。

- real user ID 真实用户 id。顾名思义，谁运行的程序，真实用户 id 就是谁。

- saved user ID 保存的用户 id。它进程根据需要在有效用户标识和真实用户标识之间进行切换。这种灵活性很重要，因为始终以提升的权限运行不是安全的做法。

所以，当你修改另一个用户时，进程知道你的真实 uid，也知道你要修改用户 uid，所以你没有权限修改（除非 root）

## 算啥？

```sh
{ echo hello; echo good; } | tr '[:lower:]' '[:upper:]'
# 分别将两个命令传递给 tr 执行

{ echo hello; echo good; } | wc
# 本以为会分别输出两行，结果确实两行相加
```

## 文件系统

某些文件和文件夹的权限问题，不在此提及，因为这些都是可以改变的。有需要可以自己通过 `ll` 命令查看。

- /bin -> /usr/bin
- /usr
  - /usr/bin 系统必备相关命令
  - /usr/sbin 系统管理相关命令
  - /usr/share 共享数据文件，如帮助文档、文档样式表、字体文件等
  - /usr/include 存放 C/C++ 等编程语言的头文件，这些头文件通常被开发者用来包含到自己的代码中，以便访问系统提供的库函数和数据结构。
  - /usr/local 存放用户自行安装的软件和程序，这些软件通常不是系统自带的。
  - /usr/src
- /etc 系统配置文件
- /home 用户目录
- /root 管理员的目录
- /data 用来存储各种数据，如日志文件、数据库文件、应用程序数据等。
- /boot 存储启动时所需的文件。这些文件包括操作系统的内核文件、引导加载程序（bootloader）的配置文件以及其他引导相关的文件。
- /sbin -> /usr/sbin
- /lib  -> /usr/lib
- /dev 设备驱动 (device)
- /opt 可选的（optional）应用程序或软件包的目录，通常由第三方软件包或大型应用程序使用。用于存放不属于操作系统发行版的软件包
- /tmp 临时文件，系统重启后会清空
- /var 存放频繁变化的文件、数据以及日志信息。
- /misc 杂项
- /proc 存放正则运行的各个进程。`ls /proc -v` 和 `ps -eo pid | ls -v` 的输出结果几乎相同。是一个虚拟文件系统（Virtual File System），用于提供关于当前运行中的进程和系统内核状态的信息。/proc 目录下的文件和子目录都是内核运行时动态生成的，因此它不是一个实际的文件系统，而是一个动态的信息源。
- /sys 类似于 /proc 目录，它提供了与系统内核和硬件相关的信息。/sys 目录下的文件和子目录主要用于与系统的设备、驱动程序和内核参数进行交互，以及获取有关系统硬件和设备的详细信息。
- /media 用于挂载可移动介质（如USB闪存驱动器、光盘、移动硬盘等）的标准目录。当插入可移动介质时，通常会自动将其挂载到 /media 目录下，以便用户可以访问其内容。

进程目录 /proc 下各目录详解

|         |     |
| ------- | --- |
|         |     |
| cmdline |     | 启动当前进程的完整命令，但僵尸进程目录中的此文件不包含任何信息
| cwd     |     | 指向当前进程运行目录的一个符号链接
| environ |     | 当前进程的环境变量列表，彼此间用空字符（NULL）隔开；变量用大写字母表示，其值用小写字母表示
| exe     |     | 指向启动当前进程的可执行文件（完整路径）的符号链接，通过/proc/N/exe可以启动当前进程的一个拷贝
| fd      |     | 这是个目录，包含当前进程打开的每一个文件的文件描述符（file descriptor），这些文件描述符是指向实际文件的一个符号链接
| limits  |     | 当前进程所使用的每一个受限资源的软限制、硬限制和管理单元；此文件仅可由实际启动当前进程的UID用户读取（2.6.24以后的内核版本支持此功能）
| maps    |     | 当前进程关联到的每个可执行文件和库文件在内存中的映射区域及其访问权限所组成的列表
| mem     |     | 当前进程所占用的内存空间，由open、read和lseek等系统调用使用，不能被用户读取
| root    |     | 指向当前进程运行根目录的符号链接；在Unix和Linux系统上，通常采用chroot命令使每个进程运行于独立的根目录
| stat    |     | 当前进程的状态信息，包含一系统格式化后的数据列，可读性差，通常由ps命令使用
| statm   |     | 当前进程占用内存的状态信息，通常以“页面”（page）表示
| status  |     | 与stat所提供信息类似，但可读性较好，每行表示一个属性信息
| task    |     | 目录文件，包含由当前进程所运行的每一个线程的相关信息，每个线程的相关信息文件均保存在一个由线程号（tid）命名的目录中，这类似于其内容类似于每个进程目录中的内容；（内核2.6版本以后支持此功能）
