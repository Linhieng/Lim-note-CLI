# Windows 中的其他内容（不适合放在 powershell 和 cmd 中的）

## WinRAR 命令行

Window 中自带的 `compact` 命令可以压缩内容，但并不会生成对应的压缩包（比如 .zip 文件）

想要通过脚本来压缩文件，还是得安装软件，比如 WinRAR。WinRAR 支持命令行，其文档也非常详细。文档所在位置默认为："C:\Program Files\WinRAR\WinRAR.chm"

下面是一个简单的 bat 脚本示例：

```bat
set winrar="C:\Program Files\WinRAR\WinRAR.exe"
%winrar% a -ibck -r -x@ignore-zip.txt Backup.zip
```

说明:

- `a` 是命令，表示添加文件到压缩包
- `-ibck` 是参数，表示在后台压缩——不会显示窗口
- `-r` 是参数，表示递归遍历子文件夹
- `-x@ignore-zip.txt` 是参数，表示忽略 `ignore-zip.txt` 文件中指定的文件。
- `Backup.zip` 是文件名，最终会生成该压缩文件，没有指定后缀名时默认是 `rar`。注意，该压缩包内原有的压缩文件不会被删除。
- 最后忽略了一个参数，默认为当前目录。

此外还有 `-n` 和 `-n@` 参数，这两个的作用和 `-x`, `-x@` 相反。

## win + r

有了 win+s 搜索功能后， win+r 使用频率少了很多

| 目前为止还算比较有用的 | 简单说明                         |
|------------------------|-------------------------------|
| `shell:startup`        | 启动目录                         |
| `control`              | 控制程序                         |
| `regedit`              | 注册表                           |
| `winver`               | 关于 windows ( windows 内核版本) |

| 可用 win+s 替代，或者已经变得容易找到的内容 | 简单说明                    |
|--------------------------------------------|---------------------------|
| `calc`                                     | 计算器                      |
| `osk`                                      | 虚拟键盘                    |
| `write`                                    | 写字板                      |
| `notepad`                                  | 记事本                      |
| `mspaint`                                  | 画图                        |
| `magnify`                                  | 放大镜                      |
| `SnippingTool `                            | 截图工具                    |
| `control keymgr.dll`                       | 凭据管理器                  |
| `control folders`                          | 文件资源管理器选项          |
| `sysdm.cpl`                                | 系统属性 (可配置环境变量)   |
| `SystemPropertiesAdvanced`                 | 高级系统设置（环境变量）      |
| `cleanmgr`                                 | 磁盘清理                    |
| `taskschd.msc`                             | 任务计划程序                |
| `WF.msc`                                   | 防火墙 (管理端口的出入规则) |
| msinfo32                                   | 系统信息。可查看 BIOS 模式   |

| 不太常用                                             | 说明                                                          |
|------------------------------------------------------|-------------------------------------------------------------|
| `optionalFeatures`                                   | 启动或关闭 Window 功能。可开启 Telnet 客户端功能，开启 IE11 等。 |
| `explorer ::{7007ACC7-3202-11D1-AAD2-00805FC1270E}`  | 打开网络连接                                                  |
| `nslookup`                                           | IP 地址检测器，可检测 DNS                                      |
| `ncpa.cpl`                                           | 网络连接                                                      |
| `powercfg.cpl`                                       | 电源选项                                                      |
| `inetcpl.cpl`                                        | internet 属性                                                 |
| `mmsys.cpl`                                          | 声音                                                          |
| `desk.cpl`                                           | 显示                                                          |
| `timedate.cpl`                                       | 日期和时间                                                    |
| `appwiz.cpl`                                         | 程序与功能（卸载）                                              |
| `compmgmt.msc`                                       | 计算机管理                                                    |
| `rundll32.exe powrprof.dll,SetSuspendState Hibemate` | 休眠，不是息屏                                                 |
| `netplwiz`                                           | 配置用户账户                                                  |
| `dcomcnfg`                                           | 组件服务                                                      |
| `msconfig`                                           | 系统配置，适合 windows7 下控制开机启动程序                     |
| `mmc`                                                | 控制台                                                        |
| `mstsc`                                              | 远程桌面连接                                                  |
