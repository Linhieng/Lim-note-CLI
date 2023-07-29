## 基础

```bat
@REM 这里是注释。

@REM 通过 set 设置变量
set name=John

@REM bat 中每一行都是 cmd 中的命令
echo My name is %name%
```

### if
```bat
if "%name%"=="John" (
    echo Hello, John!
) else (
    echo Hello, stranger!
)
```

### for

通过 `for /?` 获取更详细的内容

```bat
@REM 输出 1 3 5 7 9
for %%i in (1 3 5 7 9) do (
    echo %%i
)
@REM 或者利用 /L 更方便的输出 1 3 5 7 9
for /L %%i in (1,2,9) do (
    echo %%i
)
```

### goto

```bat
@echo off
chcp 65001 > nul
goto Label1
echo "我不会被输出"
:Label1
echo "直接输出我"
```

## 隐藏窗口运行

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