Window 中自带的 `compact` 命令可以压缩内容，但并不会生成对应的压缩包（比如 .zip 文件）

想要通过脚本来压缩文件，还是得安装软件，比如 WinRAR。WinRAR 支持命令行，其文档也非常详细。文档所在位置默认为："C:\Program Files\WinRAR\WinRAR.chm"

下面是一个简单的 bat 脚本示例：
```bat
set winrar="C:\Program Files\WinRAR\WinRAR.exe"
%winrar% a -ibck -r -x@ignore-zip.txt Backup.zip
```

说明：
- `a` 是命令，表示添加文件到压缩包
- `-ibck` 是参数，表示在后台压缩——不会显示窗口
- `-r` 是参数，表示递归遍历子文件夹
- `-x@ignore-zip.txt` 是参数，表示忽略 `ignore-zip.txt` 文件中指定的文件。
- `Backup.zip` 是文件名，最终会生成该压缩文件，没有指定后缀名时默认是 `rar`。注意，该压缩包内原有的压缩文件不会被删除。
- 最后忽略了一个参数，默认为当前目录。

此外还有 `-n` 和 `-n@` 参数，这两个的作用和 `-x`, `-x@` 相反。