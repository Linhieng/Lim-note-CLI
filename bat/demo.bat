@echo off

@REM 输出帮助信息，使用 GBK 编码能够输出中文信息
chcp 936 > nul
pause /? > %~dp0/pause.txt
echo /? > %~dp0/echo.txt
exit /? > %~dp0/exit.txt
set /? > %~dp0/set.txt
goto /? > %~dp0/goto.txt
if /? > %~dp0/if.txt
for /? > %~dp0/for.txt

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