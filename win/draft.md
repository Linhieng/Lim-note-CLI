# 草稿

```powershell


Get-NetTCPConnection | Where-Object { $_.LocalPort -ge 3000 } | Format-Table -AutoSize
# 查看当前正在使用的 TCP 连接和端口信息。然后你可以通过筛选端口号大于 3000 的连接
```
