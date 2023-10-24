<!-- cSpell:word ERRORLEVEL PNPUTIL winrar -->
<!-- cSpell:ignore mshta vbscript createobject wscript -->

# windows Command Prompt 命令

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

command                                                         | 说明
----------------------------------------------------------------|------------------------------------------------------------------------
`tree <path> [\F] [\A]`                                         | 输出目录。`\F` 表示包含文件。`\A` 表示使用 ASCII 字符构成 tree
`CertUtil -hashfile <file_url> [<hash>]`                        | 默认 `SHA1`, 还支持 `MD5`, `SHA256` 等
`DISM.exe /Online /Export-Driver /Destination:<backup_url>`     | 备份驱动，如 `DISM.exe /Online /Export-Driver /Destination:E:\Drivers`
`PNPUTIL /add-driver <glob_patterns> /subDirs /install /reboot` | 加载驱动，如 `PNPUTIL /add-driver E:\drivers\*inf" /subDirs /install /reboot`

## `SCHTASKS` 操作 Window 定时任务

常用语法：

```sh
SCHTASKS /Create /TN <唯一标识-任务名称> /TR <运行命令> /SC <频次> /ST <开始时间?>
```

指定频次为 `ONCE` 时，必须指定 `/ST` 参数。

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
- `list volume` 列出所有卷（一个磁盘可以分为多个卷）
- `list partition` 显示当前磁盘的分区列表（可查看恢复分区）
- `attributes disk` 查看相关属性。`attributes` 可简写成 `att`。
    - `attributes disk set readonly` 移动硬盘立马生效，移动磁盘需重新连接。
    - `attributes disk clear readonly` 均立马生效
- `select disk <ID>`

## bat 脚本基本使用

### 变量

```bat
@REM 这是注释，下面一行表示不回显
@echo off

@REM 每一行都是一条命令行语句，比如下面这样。
chcp 65001 > nul

@REM 使用 set 创建变量
@REM 等号左边不允许有空格
@REM 等号右边的空格，引号都会被会被认为是字符
set a=hello, world!

@REM 通过 %% 包括变量可以使用该变量。下面代码将会输出 hello, world!
echo %a%

@REM 拼接变量时，直接放在一起，多余的空格同样会被识别为字符。
set path=C:\Program Files\
set file=WinRAR\
set target=%path%%file%
echo 截取变量 target: [%target:~1,-4%]

@REM 常见的终端命令，可以直接在 bat 脚本中使用。但使用时就需要注意变量中的空格，这个时候就可以通过引号包括起来。

cd %target%

@REM bat 中常见的内置变量有：
echo 当前目录: %CD%
echo 星期+日期: %DATE%
echo 当前时间: %TIME%
echo 0-32767随机数字: %RANDOM%
echo 传入的第一个参数: %1
echo error level: %ERRORLEVEL%

echo 脚本路径: %0
echo 脚本目录: %~dp0
echo 完整文件名: %~nx0
echo 不含扩展名: %~n0
echo 只含扩展名: %~x0
```

### 常用命令

具体使用请通过 `/?` 查阅。

- `pause`
- `echo`
- `exit`
- `set`
- `goto`
- `if`
- `for` 暂时不建议在 for 中使用 `set`

### demo

```bat
@echo off

@REM 输出帮助信息，使用 GBK 编码能够输出中文信息
chcp 936 > nul
pause /? > %~dp0/pause.txt
echo  /? > %~dp0/echo.txt
exit  /? > %~dp0/exit.txt
set   /? > %~dp0/set.txt
goto  /? > %~dp0/goto.txt
if    /? > %~dp0/if.txt
for   /? > %~dp0/for.txt

chcp 65001 > nul

@REM 在 bat 脚本中使用 for 需要注意以下内容
@REM for 中的可变参数，需要使用使用两个百分号，并且变量名如果是两位会出错
for %%f in (1 2 3) do (
    echo %%f
)
@REM for 中直接通过 set 定义变量不会立马生效，也就是无效
set a=123
for %%f in (1 2) do (
    set c=123
    @REM 不加感叹号，会提示 ECHO 已禁用
    @REM 加上感叹号，会发现没有 c 变量
    echo !%c%!
    @REM 不过 for 外的变量依旧可以使用。
    echo %a%
)

exit
```

### 隐藏窗口运行

```bat
@echo off
chcp 65001 > nul
title "隐藏 bat 运行窗口"

if "%1" == "hide" goto hide_window_run
    mshta vbscript:createobject("wscript.shell").run("%~nx0 hide",0)(window.close)
    exit
:hide_window_run
@REM 从这里开始写代码
node C:/Users/Public/workspace/test.js
```

- `@echo off` 表示不显示
- `if "%1" == "h" goto begin` 中 `%1` 是执行脚本时传入的第一个参数。
- `mshta` 是 Windows 系统上的一个可执行程序，它用于运行 HTML 应用程序。
- `vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)` 是一个 VBScript 代码片段
    - `createobject("wscript.shell").run()` 创建了 WScript.Shell 对象，并调用其 run 方法来执行一个命令
    - `"%~nx0 h"` 是要运行的命令
        - `%~nx0` 是一个特殊的变量，表示当前脚本文件的完整路径和文件名。
            - `%~n` 表示去掉扩展名的文件名部分
            - `%~x` 表示扩展名部分
            - `%0`  表示当前脚本文件的路径和名称。
        - `h` 是作为参数传递给脚本的值。
    - `0` 表示隐藏打开的 bat 窗口。 此外还有 `1`（正常窗口），`2`（最小化窗口），`3`（最大化窗口）
    - `(window.close)` 表示关闭打开的 vbscript 脚本窗口。
- `exit` 表示退出当前 bat
