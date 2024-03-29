# 草稿

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
