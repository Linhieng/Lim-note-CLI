# 草稿

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/set_1
用于临时修改环境变量的 set 命令

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/setx
用于永久修改环境变量的 setx 命令

```powershell

# 想要为多个命令使用别名，可以采用函数的方式
function Get-NginxProcesses {
    tasklist | Select-Object -First 3
    tasklist | findstr "imagename eq nginx.exe"
}
$ Get-NginxProcesses



New-Alias -Name "ls" -Value "Get-ChildItem"
# 为一个命令提供别名。只能是命令，不支持参数。
# New-Alias -Name "ll" -Value "get-childitem -af -h" ❌

Get-NetTCPConnection | Where-Object { $_.LocalPort -ge 3000 } | Format-Table -AutoSize
# 查看当前正在使用的 TCP 连接和端口信息。然后你可以通过筛选端口号大于 3000 的连接
```
