# 草稿

[node 加载模块逻辑](https://nodejs.org/api/modules.html#loading-from-node_modules-folders)

## 命令行

```sh
npm link
# 将当前目录下的模块作为作为全局模块。案例：https://github.com/nodejs/examples/blob/main/cli/commander/fake-names-generator/README.md

npm link <package>
# 安装本地某个模块，需要该模块已经 link 到全局模块中才可以安装。

npm unlink <package> -g
# 卸载某个模块

npm root
# Print the effective node_modules folder to standard out.

npm root -g
# 获取全局 node_modules 目录
```

# 草稿

## 命令行

```sh
npm link
# 将当前目录下的模块作为作为全局模块。案例：https://github.com/nodejs/examples/blob/main/cli/commander/fake-names-generator/README.md

npm unlink <package-name> -g
# 卸载
```