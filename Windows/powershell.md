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
