# 草稿

## 命令行

```sh
npm link
# 将当前目录下的模块作为作为全局模块。案例：https://github.com/nodejs/examples/blob/main/cli/commander/fake-names-generator/README.md

npm link <package>
# 安装本地某个模块，需要该模块已经 link 到全局模块中才可以安装。

npm unlink <package> -g
# 卸载某个模块
```
