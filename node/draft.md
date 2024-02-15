# 草稿

## npm 全局模块

[node 加载模块逻辑](https://nodejs.org/api/modules.html#loading-from-node_modules-folders)

```sh
npm root
# Print the effective node_modules folder to standard out.

npm root -g
# 获取全局 node_modules 目录
```

方法：

- 在用户目录下创建 node_modules 快捷方式

        New-Item -ItemType SymbolicLink -Target (npm root -g) -Path "$HOME\.node_modules" -Force

- 添加 NODE_PATH 环境变量

        [Environment]::SetEnvironmentVariable("NODE_PATH", $(npm root -g), "Machine")
        # 需要管理员权限

## 命令行

```sh
npm link
# 将当前目录下的模块作为作为全局模块。案例：https://github.com/nodejs/examples/blob/main/cli/commander/fake-names-generator/README.md

npm link <package>
# 安装本地某个模块，需要该模块已经 link 到全局模块中才可以安装。

npm unlink <package> -g
# 卸载某个模块
```
