# 迁移中

只记录 powershell7 内容

注意事项：

- 调用函数时，没有括号！
- 脚本使用 utf8 BOM 编码

## 环境变量

- `[Environment]::SetEnvironmentVariable(KEY, VALUE)`
- `[Environment]::GetEnvironmentVariable`

```powershell
[Environment]::SetEnvironmentVariable("NODE_HOME", $(npm root -g), "User")
# 添加用户环境变量。
# [Environment]::SetEnvironmentVariable() 是一个 .NET Framework 中 System.Environment 类
# 的静态方法，用于设置环境变量。


# 设置环境变量名和值
$envVariableName = "NGINX_HOME"
$envVariableValue = "C:\soft\it\nginx-1.25.4"
# 使用 [System.Environment]::SetEnvironmentVariable() 方法添加环境变量到用户级别
[System.Environment]::SetEnvironmentVariable($envVariableName, $envVariableValue, [System.EnvironmentVariableTarget]::User)
# 或者直接写成下面这样也是可以的
[Environment]::SetEnvironmentVariable("HELLO", "WORLD", "User")

[Environment]::SetEnvironmentVariable("TEMPORARY_KEY", "hello, world")
# 临时的环境变量

[Environment]::GetEnvironmentVariable("NGINX_HOME")
# 获取环境变量
```

- `env:`
- `$env`

```powershell
$env:NGINX_HOME
# 输出环境变量 NGINX_HOME
# 如果是用户权限，则只能获取用户级别的环境变量
# 如果是管理员权限，则可以获取系统级别的环境变量


Get-ChildItem env:
ls env:
# 获取环境变量 $env 的值
# 能获取什么级别，取决于运行的模式（用户还是管理员）

$env:<key> = "<value>"
# 设置临时环境变量，

explorer $env:LOCALAPPDATA
# 使用环境变量
```

其他

```powershell
gv
Get-Variable
# 查看当前 powershell 的变量
```

### 常用的 Windows 内置变量

Windows 中一些我觉得有用的全局变量，内容提取自 `ls env:`

| env                     | path                                   |
|-------------------------|----------------------------------------|
| SystemDrive             | C:                                     |
| HOMEDRIVE               | C:                                     |
| SystemRoot              | C:\Windows                             |
| windir                  | C:\Windows                             |
|                         |                                        |
| PUBLIC                  | C:\Users\Public                        |
| USERPROFILE             | C:\Users\{username}                    |
| APPDATA                 | C:\Users\{username}\AppData\Roaming    |
| LOCALAPPDATA            | C:\Users\{username}\AppData\Local      |
| TEMP                    | C:\Users\{username}\AppData\Local\Temp |
| TMP                     | C:\Users\{username}\AppData\Local\Temp |
|                         |                                        |
| ProgramData             | C:\ProgramData                         |
| ALLUSERSPROFILE         | C:\ProgramData                         |
| ProgramFiles            | C:\Program Files                       |
| ProgramFiles(x86)       | C:\Program Files (x86)                 |
| CommonProgramFiles      | C:\Program Files\Common Files          |
| CommonProgramFiles(x86) | C:\Program Files (x86)\Common Files    |
|                         |                                        |
| COMPUTERNAME            | DESKTOP-???                            |
| HOMEPATH                | \Users\{username}                      |
| LOGONSERVER             | \\{HOST_NAME}                          |
| PROCESSOR_ARCHITECTURE  | AMD64                                  |
| USERDOMAIN              | {HOST_NAME}                            |
| USERNAME                | {username}                             |

## 文件和文件夹

- Copy-Item
- Get-Content
- New-Item
- Get-ChildItem

案例

```powershell
Copy-Item -Path "D:\draft\all-code-tmp\MyTool.psm1" -Destination "$PSHOME\Modules\MyTool"
# 将文件拷贝到指定目录

Get-Content G:\backup-mysql\db01.sql | mysql -uroot -p old_db01
# 导入 sql 文件

New-Item -ItemType SymbolicLink -Target (npm root -g) -Path "$HOME\.node_modules" -Force
# 以管理员方式运行。强制创建文件夹 $HOME\.node_modules，并将其指向 npm 全局模块中。
# 注意创建的是符号链接，而不是 win 中的快捷方式

cd C:\soft\it\mkcert
New-Item -ItemType SymbolicLink -Target .\mkcert-v1.4.4-windows-amd64.exe -Path mkcert.exe
# 为 mkcert-v1.4.4-windows-amd64.exe 创建一个软连接，名为 mkcert.exe 注意要有后缀名 exe
# 或者，如果已经添加 C:\soft\it\mkcert 到 path，则可以不需要移动到 mkcert，直接：
New-Item -ItemType SymbolicLink -Target mkcert-v1.4.4-windows-amd64.exe -Path C:\soft\it\mkcert\mkcert.exe
# 注意两个 .exe 都不能省略。

New-Item -Path '<new_directory_url>' -ItemType Directory
# 创建文件夹

New-Item -Path '<new_file_url>' -ItemType File
# 创建文件，如果文件已存在则报错

New-Item -Force -Path '<new_file_url>' -ItemType File
# 强制创建文件，如果文件已存在则会被覆盖

Get-ChildItem -Path . -Recurse -Exclude "node_modules" -File | Where-Object { $_.Name -like "playwright.config*" }
# 在该目录下查找 playwright.config 开头文件，并忽略 node_modules 文件夹

```

获取 lnk 文件的指向

```powershell
function get_lnk_target($fullpath) {
  $sh = New-Object -ComObject WScript.Shell
  $target = $sh.CreateShortcut($fullpath).TargetPath
  return $target
}
```

## 系统和硬件相关信息、pwsh 版本

```powershell
$PSVersionTable
$host.version
Get-Host
# pwsh 版本信息

Get-CimInstance -ClassName Win32_OperatingSystem
$PSVersionTable.OS.Version
# win 版本号。比如 19045.3805 版本时，能获取到 19045

Get-ItemProperty -Path  "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" | Select-Object -ExpandProperty "UBR"
# 通过注册表获取版本号后面的 3805
Get-ItemProperty -Path  "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" | Select-Object -Property "CurrentBuildNumber", "UBR"
# 获取直接显示内部版本号和 UBR


(Get-CimInstance win32_processor).NumberOfLogicalProcessors
# 获取逻辑处理器个数
```

获取硬件 ID 相关命令。
注意，没有什么是能够绝对标识唯一主机的，相对靠谱的是主板 UUID。

```powershell

systeminfo
# 获取系统信息，包括：
# 网卡 MAC 地址、BIOS、虚拟化支持等等

wmic cpu get processorid
# 可以获取 CPU ID。（并不唯一，Intel现在可能同一批次的CPU ID都一样）
# 实测，重装系统不会改变它

wmic diskdrive get serialnumber
# 获取硬盘序列号。（不一定所有的电脑都能获取到硬盘序列号）
# 实测，重装系统不会改变它

wmic csproduct get UUID
# 主板序列号（不是所有的厂商都提供一个UUID，可能返回一个全 F 的无效 UUID）
# dmidecode -s system-uuid 用于 linux 获取主板 UUID
# 实测，重装系统不会改变它
```

## 样式、颜色

```powershell
# 定义颜色数组
$colors = @(
    "Black", "DarkBlue", "DarkGreen", "DarkCyan",
    "DarkRed", "DarkMagenta", "DarkYellow", "Gray",
    "DarkGray", "Blue", "Green", "Cyan",
    "Red", "Magenta", "Yellow", "White"
)

# 遍历数组并输出每种颜色的示例
foreach ($color in $colors) {
    Write-Host "This is $color text" -ForegroundColor $color
}
```

## 计划任务

更多配置项可以参考：[new-scheduledtasksettingsset]

```powershell
$taskName = "MyTask"

# 检查任务是否存在
$taskExists = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

# 如果任务存在，则删除它
if ($taskExists) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
} else {
    Write-Host "任务 $taskName 不存在，不需要删除。"
}

# 如果需要隐藏窗口，可以直接在 Start-Process 后添加 -WindowStyle hidden
$action = New-ScheduledTaskAction -Execute "pwsh.exe" -Argument "-Command `"Start-Process -FilePath pwsh.exe -ArgumentList 'D:\github-code\AutoTask\scripts\auto-push.ps1'`""
# 每晚 10:20 分
$trigger = New-ScheduledTaskTrigger -Daily -At "10:20:00 PM"
# 需要有网络时才运行
$settings = New-ScheduledTaskSettingsSet -Hidden -RunOnlyIfNetworkAvailable
$description = "这是一个定时推送本地 git 仓库的计划任务"
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Description $description
```

## 零碎，暂不成体系

### 编码问题

```powershell
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
# 使用 chcp 修改无效的，得通过这种方式修改才有效
```

### 命令别名、函数

```powershell
New-Alias -Name "ls" -Value "Get-ChildItem"
# 为一个命令提供别名。只能是命令，不支持参数。
# New-Alias -Name "ll" -Value "get-childitem -af -h" ❌


# 想要为多个命令使用别名，可以采用函数的方式
function Get-NginxProcesses {
  tasklist | Select-Object -First 3
  tasklist | findstr "imagename eq nginx.exe"
}
Get-NginxProcesses


function hello_world {
  param(
    [string] $hello,
    [string] $world
  )

  Write-Host $hello $world -ForegroundColor "green"
}

hello_world -hello "你好" -world "世界"
```

### 错误处理

```powershell
function test {
  throw "这是一个自定义错误"
}

try {
  test
} catch {
  Write-Host $_
}
```

### 模块

```powershell
Write-Host $PSHOME\Modules
# 查看模块路径。pwsh

Copy-Item -Path "D:\draft\all-code-tmp\MyTool.psm1" -Destination "$PSHOME\Modules\MyTool"
# 模块内要有一个文件名与模块名相同

Get-Command -Module MyTool
# 查看模块

Hello-World
# 直接运行模块内的函数
```

### 工具 CertUtil, Get-Command

```powershell
CertUtil -hashfile <file_url> [<hash>]
# 可用于计算文件的哈希值。默认 SHA1，还支持 MD5, SHA256 等

Get-Command
# 获取所有可运行命令。替代 where。案例：
(Get-Command cmd).Path
(Get-Command cmd).Source
```

### 其他 ForEach-Object, Start-Process

```powershell
ls | ForEach-Object { echo $_ }
# ForEach-Object { } 是 PowerShell 中的一个 cmdlet，用于迭代集合中的每个对象
# $_ 代表当前迭代的对象

Start-Process -WindowStyle hidden -FilePath pwsh.exe -ArgumentList "D:\draft\all-code-tmp\test.ps1"
# 隐藏窗口运行脚本

```

### 脚本参数

在 a.ps1 中

```powershell
Start-Process -FilePath pwsh.exe -ArgumentList "-File", "D:\draft\all-code-tmp\x.ps1", "-param1", "value1", "-param2", "value2"
```

在 D:\draft\all-code-tmp\x.ps1 文件夹中：

```powershell
param (
    [string]$param1,
    [string]$param2
)

Write-Host "参数1：$param1"
Write-Host "参数2：$param2"
```

---
[new-scheduledtasksettingsset]: https://www.pdq.com/powershell/new-scheduledtasksettingsset/#RunOnlyIfNetworkAvailable
