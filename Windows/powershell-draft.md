# 草稿

## 终止占用 8080 端口的进程

```ps1
Get-Process -Id (Get-NetTCPConnection -LocalPort 8080).OwningProcess
# 该命令用于获取占用 8080 端口的进程信息，会输出以下信息
Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
-------  ------    -----      -----     ------     --  -- -----------
    581      39   229100     174772      20.39  14784   1 java
# handles 表示该进程打开的对象数量，比如文件句柄、线程句柄、事件句柄等
# NPM, PM 和 WS 都是内存相关参数
# Id 指的就是进程唯一 PID
# SI 是该进程的 Session ID

$processId = (Get-NetTCPConnection -LocalPort 8080).OwningProcess
# 获取端口 PID，保存在 $processId 变量中
Stop-Process -Id $processId
# 终止该进程
```
