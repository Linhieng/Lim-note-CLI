<!-- spell-checker:ignore Dobbeleer pwsh rudolfs -->
<!-- spell-checker:word powerline fullpath winget -->

# powershell 命令

通过 `get-help <command> -online` 命令可以打开对应命令官方文档。

bat 中执行 ps1 脚本：`powershell -ExecutionPolicy ByPass -File "bat.ps1"`

## 网络

```ps1
Resolve-DnsName <domain>

Get-NetTCPConnection
# 查看端口占用情况

Get-NetTCPConnection | Where-Object {$_.LocalPort -eq 80}
# 只查看 80 端口的占用情况 $_ 变量表示管道传递的对象。
```

## 文件和文件夹

```sh
New-Item -Path '<new_directory_url>' -ItemType Directory
# 创建文件夹

New-Item -Path '<new_file_url>' -ItemType File
# 创建文件，如果文件已存在则报错

New-Item -Force -Path '<new_file_url>' -ItemType File
# 强制创建文件，如果文件已存在则会被覆盖

Get-ChildItem -Path . -Recurse -Exclude "node_modules" -File | Where-Object { $_.Name -like "playwright.config*" }
# 在该目录下查找 playwright.config 开头文件，并忽略 node_modules 文件夹
```

## powershell 命令提示符

修改命令提示符，让其只显示当前目录：

1. `code $Profile`
    - 该命令将通过 vscode 打开配置文件，如果不存在该文件，vscode 会自动创建。
    - 默认文件所在位置为：`%UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
2. 写入以下内容：

    ```ps1
    function prompt {
        $p = Split-Path -leaf -path (Get-Location)
        "$p> " # 最后一个表达式默认就是返回值，所以这里省略了 return
    }
    ```

>
> 备注：
>
> 如果提示“无法加载文件 %UserProfile%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1，因为在此系统上禁止运行脚本”。请执行 `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` 命令。

如果想要修改命令提示符的颜色，可以使用以下代码：

```ps1
function prompt {
    $promptString = Split-Path -leaf -path (Get-Location)
    "$([char]0x1b)[92m" + "$promptString" + "$([char]0x1b)[91m" + " > "
}
```

更多颜色，可通过运行 `Get-PSReadLineOption` 命令查看。

### [oh my posh](https://ohmyposh.dev/) 命令行提示符主题

基本步骤如下：

1. 安装 [Window terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701)
2. 确保有 `winget` 命令行
3. 执行 `winget install JanDeDobbeleer.OhMyPosh -s winget` 然后重启终端
4. 管理员权限下安装字体 `oh-my-posh font install`
5. 在 Window terminal 中修改字体为刚刚安装的字体
6. 查看所有可用主题 `Get-PoshThemes` 。如果没有出现图标，那就是字体没有设置好，请重新设置字体或者重启终端。注意在 vscode 中主要在 settings 中设置字体，配置项为 `"terminal.integrated.fontFamily": "Hack Nerd Font"`
7. 执行命令（注意替换 `<theme-name>`） `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\<theme-name>.omp.json"`，此时会输出一行字符串，执行该字符串就可以应用主题。以主题 `rudolfs-dark` 为例，执行 `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json"`，然后再执行输出的字符串。或者直接 `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression` 。
8. 通过命令 `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" > $profile` 将对应命令添加到 `$profile` 就可以实现每次启动 powershell 都自动执行该命令了。

自定义主题：

1. 创建自己的文件样式文件：`code "$env:POSH_THEMES_PATH/lim-default.omp.json"`
2. 编写样式（可以在别人的主题上进行修改）~~快逃，这是个兔子洞~~
3. 应用：`oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/lim-default.omp.json" > $profile`

在 [nerd fonts 中查看所有可用特殊字符](https://www.nerdfonts.com/cheat-sheet)

[我的主题参考](https://gist.github.com/Linhieng/092192b87a23e9c53f77249f14e267dd)

虽然 oh my posh 很漂亮，但每次打开终端都需要稍等一会（大概 800ms），所以默认的命令行还是自己实现比较好。

### 正则替换路径中的 `\` 为 `/`

```ps1
$full_path = "/" + (Get-Location) -replace ":?\\", "/"
echo $full_path
```

参考自 [正则替换字符串](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_comparison_operators#replacement-operator)

### 命令行提示符换行 + 查看当时终端是否是管理员模式

参考自 [about_Prompts](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_prompts?view=powershell-7.3) 和 [stack overflow](https://stackoverflow.com/questions/37367460/how-achieve-a-two-line-prompt)

```ps1
function prompt {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
    $fullpath = (Get-Location) -replace "\\", "/"

    if($principal.IsInRole($adminRole)) {
        ([System.Environment]::NewLine) + "[Admin] " + "$([char]0x1b)[92m" + "$fullpath" + "$([char]0x1b)[91m" + ([System.Environment]::NewLine) + "> "
    } else  {
        ([System.Environment]::NewLine) + "$([char]0x1b)[92m" + "$fullpath" + "$([char]0x1b)[91m" + ([System.Environment]::NewLine) + "> "
    }
}
```
