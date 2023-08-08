## 变量

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

## 常用命令

- `PAUSE`
- `REM`
- `ECHO`
- `EXIT`

- `GOTO`
    ```bat
    goto label_name
    echo miss
    :label_name
    echo catch
    ```
- `IF`
    ```bat
    if "%name%"=="John" (
        echo Hello, John!
    ) else (
        echo Hello, stranger!
    )
    ```
- `FOR`
    ```bat
    for %%i in (1 3 5 7 9) do (
        echo %%i
    )
    for /L %%i in (1,2,9) do (
        echo %%i
    )
    ```

- `SETLOCAL`, `ENDLOCAL`
- `SHIFT`
- `CALL`

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