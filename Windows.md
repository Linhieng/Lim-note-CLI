## 🍕 终端命令

Window 下的任意命令，都可以通过 `/?` 来查看更详细的内容，非常有用！
所以更详细的命令请自行通过 `/?` 查看

- `CertUtil` 计算文件哈希值
    - 常用语法：`CertUtil -hashfile <路径> <哈希算法?>`
    - 常见哈希算法有： `MD5`, `SHA1`, `SHA256`

- `SCHTASKS` 操作 Window 定时任务
    - 常用语法：`SCHTASKS /Create /TN <唯一标识-任务名称> /TR <运行命令> /SC <频次> /ST <开始时间?>`
    - 指定频次为 `ONCE` 时，必须指定 `/ST` 参数

- `DISM` 能备份驱动
    - 备份驱动：`DISM.exe /Online /Export-Driver /Destination:E:\Drivers`

- `PNPUTIL` 能加载驱动
    - 加载备份的驱动：`PNPUTIL /add-driver E:\drivers\*inf" /subDirs /install /reboot`

## 🍕 快速运行 win + r

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
