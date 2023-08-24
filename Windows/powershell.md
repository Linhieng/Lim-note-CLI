bat 中执行 ps1 脚本：`powershell -ExecutionPolicy ByPass -File "bat.ps1"`

创建文件和文件夹
```ps1
New-Item -Path '<new_directory_url>' -ItemType Directory
# 创建文件夹

New-Item -Path '<new_file_url>' -ItemType File
# 创建文件，如果文件已存在则报错

New-Item -Force -Path '<new_file_url>' -ItemType File
# 强制创建文件，如果文件已存在则会被覆盖
```

## [让 powershell 命令提示符只显示当前目录](https://superuser.com/questions/446827/configure-windows-powershell-to-display-only-the-current-folder-name-in-the-shel)

1. `code $Profile`
    - 该命令将通过 vscode 打开配置文件，如果不存在该文件，vscode 会自动创建。
    - 默认文件所在位置为：`%UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
2. 写入以下内容：
    ```ps1
    function prompt {
        $p = Split-Path -leaf -path (Get-Location)
        "$p> "
    }
    ```
>
> 备注：
>
> 如果提示“无法加载文件 %UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1，因为在此系统上禁止运行脚本”。请执行 `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` 命令。