cmd 中的任何命令，都可以通过 `<command> /?` 或者 `help <command>` 来查看该命令的使用方式。

相关操作符（暂时没有找到官方文档中对这些操作符的具体说明，不过找到一个有关 [&&](https://learn.microsoft.com/zh-cn/windows-server/administration/windows-commands/cmd#remarks) 的说明，）
```sh
<command1> && <command2>
# command1 正确时才会执行 command2

<command1> || <command2>
# command1 出错时才会执行 command2

<command1> & <command2>
# 两个命令都会执行。

<command1> | <command2>
# 两个命令都会执行。但只会输出 command1 的标准错误输出。
```

## 收集的一些命令

- `CertUtil -hashfile <路径> [<哈希算法>]`
    - 计算文件哈希值，常见哈希算法有： `MD5`, `SHA1`, `SHA256`

- `SCHTASKS` 操作 Window 定时任务
    - 常用语法：`SCHTASKS /Create /TN <唯一标识-任务名称> /TR <运行命令> /SC <频次> /ST <开始时间?>`
    - 指定频次为 `ONCE` 时，必须指定 `/ST` 参数

- `DISM.exe /Online /Export-Driver /Destination:<backup_url>`
    - 备份驱动，比如 `DISM.exe /Online /Export-Driver /Destination:E:\Drivers`

- `PNPUTIL /add-driver <glob_patterns> /subDirs /install /reboot`
    - 加载（备份的）驱动，比如 `PNPUTIL /add-driver E:\drivers\*inf" /subDirs /install /reboot`

简单的命令              | 说明
------------------------|-------------------------------------------
`tree <path> [\F] [\A]` | 输出目录。`\F` 表示包含文件。`\A` 表示使用 ASCII 字符构成 tree

## 文件管理

创建文件夹
```sh
md "<dir_path>"
# 或者
mkdir "<dir_path>"
# 注意，路径中有空格时需要使用双引号括起来，不能使用单引号。
```

创建文件。暂时没有找到官方提供的命令，所以只能通过重定向写入符号来创建文件，下面是一些案例
```sh
null > <file_url>
# 创建原理： null 不是合法命令，所以会输出错误，也就是说标准输出的是空，将空内容写入 <file_url> 文件，就是创建文件了。

type nul > <file_url>
# 同理，type 命令用于查看文件内容，而 nul 是一个特殊的文件，查看该文件的内容将会输出空，将空内容写入 <file_url> 文件，就是创建文件了。

echo '' 2> <file_url>
# 同理，由于 echo '' 命令的标准错误输出为空，将空内容写入 <file_url> 文件，就是创建文件了。

# 根据上面原理，你可以写出各种各样的命令。
```

## `DiskPart` 磁盘管理

使用 `help [command]` 查看帮助

- `DiskPart` 进入
- `list disk` 可查看当前选中的磁盘
- `attributes disk` 查看相关属性。`attributes` 可简写成 `att`。
    - `attributes disk set readonly` 移动硬盘立马生效，移动磁盘需重新连接。
    - `attributes disk clear readonly` 均立马生效
- `select disk <ID>`
