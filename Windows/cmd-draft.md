常用的内部命令有md、cd、rd、dir、path、copy、type、edit、ren、del、cls、ver、date、time、prompt。
常用的外部命令有deltree、format、diskcopy、label、vol、sys、xcopy、fc、attrib、mem、tree。

切换到其他盘符d：

1．md——建立子目录
功能：创建新的子目录
类型：内部命令ü
格式：md[盘符：][路径名]〈子目录名〉
for 1：
c:\>md y /*---建立y子目录---*/

2．cd——改变当前目录
功能：显示当前目录ü
类型：内部命令ü
格式：cd[盘符：][路径名][子目录名]
说明：cd命令不能改变当前所在的盘，cd..退回到上一级目录，cd\表示返回到当前盘的目录下，cd无参数时显示当前目录名。
for 2：
c:\>cd y /*---显示当前目录y---*/

3．rd——删除子目录命令
功能：从指定的磁盘删除了目录。
类型：内部命令ü
格式：rd[盘符：][路径名][子目录名]
for 3：
c:\>rd y

4．dir——显示磁盘目录命令
功能：显示磁盘目录的内容。
类型：内部命令ü
格式：dir [盘符][路径][/p][/w]
for 4：
c:\>dir y

5．path——路径设置命令
功能：设备可执行文件的搜索路径，只对文件有效。
类型：内部命令ü
格式：path[盘符1]目录[路径名1]{[；盘符2：]，〈目录路径名2〉…}
for 5：
c:\>path
path=c:\windows;c:\windows\command;c:\programfiles\mts
6．copy文件复制命令
ü 功能：拷贝一个或多个文件到指定盘上。
类型：内部命令ü
格式：copyü [源盘][路径]〈源文件名〉[目标盘][路径][目标文件名]
for 6_1：
c:\>copy yyy.txt yyy
1 file(s) copied
c:\yyy>dir yyy
yyy txt 8 11-23-03 19:21 /*---现在用dir命令查看复制的情况---*/
说明： 如果是将多个文件复制到一个新的文件，命令是这样的copy [源盘][路径]〈源文件a〉+[源盘][路径]〈源文件b〉[目标盘][路径][目标文件名]
for 6_2：
c:\>copy x.txt+y.txt xy.t
x.txt
y.txt
1 file(s) copied

7．type——显示文件内容命令
功能：显示ascii码文件的内容。ü
类型：内部命令。ü
ü 格式：type[盘符：][路径]〈文件名〉
for 7：
c:\>trpe yyy.txt /*---假设c盘目录下存在yyy.txt文件---*/

8．edit——编辑文件内容命令
1.功能：编辑ascii文件的内容，也可建立一个新文件。
2.类型：内部命令。
3. edit[盘符：][路径]〈文件名〉
说明： edit即可以编辑ascii文件的内容，也可以新建立一个文件，他们的扩展名命名方式也很灵活，比如.txt、.bat,甚至可以编辑.c、.bas的格式。
for 8_1：
c:\>edit /*进入编辑模式*/
for 8_2：
c:\>edit yyy.txt /*---编辑yyy.txt文件的内容，如果要选择支持中文格式，应该安装ucdos---*/

9．ren——文件改名命令
ü 功能：更改文件名称
类型：内部命令ü
格式：ren[盘符：][路径]〈旧文件名〉〈新文件名〉ü
for 9：
c:\>ren yyy.txt cly.txt

10．del——删除文件命令
功能：删除指定的文件。ü
类型：内部命令ü
ü 格式：del[盘符：][路径]〈文件名〉[/p]
说明：选用/p参数，系统在删除前询问是否真要删除该文件，若不使用这个参数，则自动删除。
	del  *exe，删除全部exe文件

11．cls——清屏幕命令
ü 功能：清除屏幕上的所有显示，光标置于屏幕左上角。
类型：内部命令ü
格式：clsü
for 11：
c:\>cls

12．ver查看系统版本号命令
功能：显示当前系统版本号ü
类型：内部命令ü
ü 格式：ver
for 12：
c:\>ver
windows 98 [version 4.10.2222] /*---当前系统的版本号---*/

13．data日期设置命令
功能：设置或显示系统日期。ü
类型：内部命令ü
ü 格式：date[mm—dd—yy]
for 13：
c:\>date
current date is sun 11-23-2
enter new date (mm-dd-yy): /*---提示你输入新的日期---*/

14．time系统时钟设置命令
功能：设置或显示系统时期。ü
类型：内部命令ü
ü 格式：time[hh：mm：ss：xx]
for 14：
c:\>time
current time is 22:49:28.81
enter new time:

15．prompt：更改命令提示符
ü 功能：改变dos系统提示符的风格。

补充：

1. dir
dir是英文单词directory(目录）的缩写，主要用来显示一个目录下的文件和子目录。
[格式] dir [盘符][路径]
2.md--建立目录
它的格式为"md [盘符][路径]"，例如"md temp"。
3.rd--删除目录
格式为"rd [盘符][路径]"。
4.cd--进入指定目录
格式为" cd [路径]"，例如"cd happy
5.copy--拷贝文件
格式为"copy [源目录或文件] [目的目录或文件
6.del--删除文件
格式为"del [盘符][路径][文件名] [参数]"
7.ren--改名
格式为"ren [原名] [现名]
8.type--显示文本文件
格式为"type [文件名]"
9.discopy--磁盘复制
[格式] diskcopy 源驱动器名 目的驱动器名
10.deltree--删除目录树
[格式] [c:][path]deltree [c1:][path1] [[c2:][path2] […]]
11. mem--查看你的计算机内存有多少，以及内存的使用情况。
[格式] 直接键入mem命令
12.chkdsk--检查你的磁盘的使用情况。
[格式] chkdsk 磁盘名
13.cls--清除显示器屏幕上的内容，使dos提示符到屏幕左上角。
[格式] cls
14.time--显示和设置dos的系统时间
[格式] time [hh[:mm[:ss[.cc]]]
15.format（format.com）--格式化命令
格式为"format [盘符] [参数]"，例如："format a: /s"。它有两个常见的参数：
/q：进行快速格式化；
/s：完成格式化，并将系统引导文件拷贝到该磁盘。
16.fdisk（fdisk.exe）--分区命令

uname 显示版本信息（同win2k的 ver）
dir 显示当前目录文件,ls -al 显示包括隐藏文件（同win2k的 dir）
pwd 查询当前所在的目录位置
cd cd　..回到上一层目录，注意cd 与..之间有空格。cd　/返回到根目录。
cat 文件名 查看文件内容
cat >abc.txt 往abc.txt文件中写上内容。
more 文件名 以一页一页的方式显示一个文本文件。
cp 复制文件
mv 移动文件
rm 文件名 删除文件，rm -a 目录名删除目录及子目录
mkdir 目录名 建立目录
rmdir 删除子目录，目录内没有文档。
chmod 设定档案或目录的存取权限
grep 在档案中查找字符串
diff 档案文件比较
find 档案搜寻
date 现在的日期、时间
who 查询目前和你使用同一台机器的人以及login时间地点
w 查询目前上机者的详细资料
whoami 查看自己的帐号名称
groups 查看某人的group
passwd 更改密码
history 查看自己下过的命令
ps 显示进程状态
kill 停止某进程
gcc 黑客通常用它来编译c语言写的文件
su 权限转换为指定使用者
telnet ip telnet连接对方主机（同win2k），当出现bash$时就说明连接成功。
ftp ftp连接上某服务器（同win2k）

网络命令大全

compmgmt.msc计 算机管理
net stop messenger 停止信使服务
conf 启动netmeeting
dvdplay dvd播放器
charmap 启动字符映射表
diskmgmt.msc 磁盘管理实用程序
calc 启动计算器
dfrg.msc 磁盘碎片整理程序
chkdsk.exe chkdsk磁盘检查
devmgmt.msc 设备管理器
regsvr32 /u *.dll 停止dll文件运行
drwtsn32 系统医生
dxdiag 检查directx信息
regedt32 注册表编辑器
msconfig.exe 系统配置实用程序
rsop.msc 组策略结果集
mem.exe 显示内存使用情况
regedit.exe 注册表
winchat xp自带局域网聊天
progman 程序管理器
winmsd 系统信息
perfmon.msc 计算机性能监测程序
winver 检查windows版本
sfc /scannow 扫描错误并复原
taskmgr 任务管理器（2000／xp／2003）
gpedit.msc 组策略
sndrec32 录音机
nslookup ip地址侦测器
explorer 打开资源管理器
logoff 注销命令
tsshutdn 60秒倒计时关机命令
lusrmgr.msc 本机用户和组
services.msc 本地服务设置
oobe/msoobe /a 检查xp是否激活
notepad 打开记事本
cleanmgr 垃圾整理
net start messenger 开始信使服务


windows运行命令全集


winver检查windows版本
dxdiag检查directx信息
mem.exe显示内存使用情况
sndvol32音量控制程序
sfc.exe系统文件检查器
gpedit.msc 组策略
regedit.exe 注册表
msconfig.exe 系统配置实用程序
cmd.exe cmd命令提示符
chkdsk.exe chkdsk磁盘检查
mem.exe显示内存使用情况
gpedit.msc 组策略
regedit.exe 注册表
msconfig.exe 系统配置实用程序
cmd.exe cmd命令提示符
services.msc 服务
lusrmgr.msc 本地账户管理
drwtsn32 系统医生
cleanmgr 垃圾整理
iexpress 木马捆绑工具，系统自带
mmc 控制台
dcpromo 活动目录安装
ntbackup 系统备份和还原
rononce -p 15秒关机
taskmgr 任务管理器
conf 启动netmeeting
devmgmt.msc 设备管理器
diskmgmt.msc nt的磁盘管理器
compmgmt.msc 计算机管理
winchat 局域网聊天
dvdplay dvd播放器
mplayer2 简易widnows media player
mspaint 画图板
nslookup 网络管理的工具
syskey 系统加密，一旦加密就不能解开，保护windows xp系统的双重密码
wupdmgr widnows update
clipbrd 剪贴板查看器
odbcad32 odbc数据源管理器
nslookup ip地址侦测器

cmd命令大全

有关某个命令的详细信息，请键入 help 命令名


xp.cmd命令大全


有关某个命令的详细信息，请键入 help 命令名
assoc 显示或修改文件扩展名关联。
at 计划在计算机上运行的命令和程序。
attrib 显示或更改文件属性。
break 设置或清除扩展式 ctrl+c 检查。
cacls 显示或修改文件的访问控制列表(acls)。
call 从另一个批处理程序调用这一个。
cd 显示当前目录的名称或将其更改。
chcp 显示或设置活动代码页数。
chdir 显示当前目录的名称或将其更改。
chkdsk 检查磁盘并显示状态报告。
chkntfs 显示或修改启动时间磁盘检查。
cls 清除屏幕。
cmd 打开另一个 windows 命令解释程序窗口。
color 设置默认控制台前景和背景颜色。
comp 比较两个或两套文件的内容。
compact 显示或更改 ntfs 分区上文件的压缩。
convert 将 fat 卷转换成 ntfs。您不能转换
当前驱动器。
copy 将至少一个文件复制到另一个位置。
date 显示或设置日期。
del 删除至少一个文件。
dir 显示一个目录中的文件和子目录。
diskcomp 比较两个软盘的内容。
diskcopy 将一个软盘的内容复制到另一个软盘。
doskey 编辑命令行、调用 windows 命令并创建宏。
echo 显示消息，或将命令回显打开或关上。
endlocal 结束批文件中环境更改的本地化。
erase 删除至少一个文件。
exit 退出 cmd.exe 程序(命令解释程序)。
fc 比较两个或两套文件，并显示
不同处。
find 在文件中搜索文字字符串。
findstr 在文件中搜索字符串。
for 为一套文件中的每个文件运行一个指定的命令。
format 格式化磁盘，以便跟 windows 使用。
ftype 显示或修改用于文件扩展名关联的文件类型。
goto 将 windows 命令解释程序指向批处理程序
中某个标明的行。
graftabl 启用 windows 来以图像模式显示
扩展字符集。
help 提供 windows 命令的帮助信息。
if 执行批处理程序中的条件性处理。
label 创建、更改或删除磁盘的卷标。
md 创建目录。
mkdir 创建目录。
mode 配置系统设备。
more 一次显示一个结果屏幕。
move 将文件从一个目录移到另一个目录。
path 显示或设置可执行文件的搜索路径。
pause 暂停批文件的处理并显示消息。
popd 还原 pushd 保存的当前目录的上一个值。
print 打印文本文件。
prompt 更改 windows 命令提示符。
pushd 保存当前目录，然后对其进行更改。
rd 删除目录。
recover 从有问题的磁盘恢复可读信息。
rem 记录批文件或 config.sys 中的注释。
ren 重命名文件。
rename 重命名文件。
replace 替换文件。
rmdir 删除目录。
set 显示、设置或删除 windows 环境变量。
setlocal 开始批文件中环境更改的本地化。
shift 更换批文件中可替换参数的位置。
sort 对输入进行分类。
start 启动另一个窗口来运行指定的程序或命令。
subst 将路径跟一个驱动器号关联。
time 显示或设置系统时间。
title 设置 cmd.exe 会话的窗口标题。
tree 以图形模式显示驱动器或路径的目录结构。
type 显示文本文件的内容。
ver 显示 windows 版本。
verify 告诉 windows 是否验证文件是否已正确
写入磁盘。
vol 显示磁盘卷标和序列号。
xcopy 复制文件和目录树。


appwiz.cpl------------添加删除程序

control userpasswords2--------用户帐户设置

cleanmgr-------垃圾整理

cmd--------------命令提示符可以当作是 windows 的一个附件，ping，convert 这些不能在图形环境下 使用的功能要借助它来完成。

cmd------jview察看java虚拟机版本。


command.com------调用的则是系统内置的 ntvdm，一个 dos虚拟机。它完全是一个类似 virtual pc 的 虚拟环境，和系统本身联系不大。当我们在命令提示符下运行 dos 程序时，实际上也 是自动转移到 ntvdm虚拟机下，和 cmd 本身没什么关系。


calc-----------启动计算器

chkdsk.exe-----chkdsk磁盘检查

compmgmt.msc---计算机管理

conf-----------启动 netmeeting

control userpasswords2-----user account 权限设置

devmgmt.msc--- 设备管理器

diskmgmt.msc---磁盘管理实用程序

dfrg.msc-------磁盘碎片整理程序

drwtsn32------ 系统医生

dvdplay--------启动media player

dxdiag-----------directx diagnostic tool

gpedit.msc-------组策略编辑器

gpupdate /target:computer /force 强制刷新组策略

eventvwr.exe-----事件查看器

explorer-------打开资源管理器

logoff---------注销命令

lusrmgr.msc----本机用户和组

msinfo32---------系统信息

msconfig---------系统配置实用程序

net start (servicename)----启动该服务

net stop (servicename)-----停止该服务

notepad--------打开记事本

nusrmgr.cpl-------同control userpasswords，打开用户帐户控制面板

nslookup-------ip地址侦测器

oobe/msoobe /a----检查xp是否激活

perfmon.msc----计算机性能监测程序

progman--------程序管理器

regedit----------注册表编辑器

regedt32-------注册表编辑器

regsvr32 /u *.dll----停止dll文件运行

route print------查看路由表

rononce -p ----15秒关机

rsop.msc-------组策略结果集

rundll32.exe rundll32.exe %systemroot%system32shimgvw.dll,imageview_fullscreen----启动一个空白的windows 图片和传真查看器

secpol.msc--------本地安全策略

services.msc---本地服务设置

sfc /scannow-----启动系统文件检查器

sndrec32-------录音机

taskmgr-----任务管理器（适用于2000／xp／2003）

tsshutdn-------60秒倒计时关机命令

winchat--------xp自带局域网聊天

winmsd---------系统信息

winver-----显示about windows 窗口

wupdmgr-----------windows update
