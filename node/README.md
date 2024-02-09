通过 `npm help <term>` 命令查看文档帮助，比如
- `npm help config` 查看 `npm config` 基本使用
- `npm help 7 config` 查看 `npm config` 的更多信息，各种 key。

常见全局配置：

full name    | aliases | 说明
-------------|---------|------------------
--global     | -g      |
--save       | -S      | （默认）保存到 `dependencies` 中
--save-dev   | -D      | 保存到 `devDependencies`

常见命令：
```sh
$ npm ci
# 严格按照 package-lock.json 中指定的版本安装依赖

$ npm init [-y]
# 初始化

$ npm (ls | list) [--global] [--depth <depth>]
# 查看安装的包。默认深度为 0。如果输出项中有 extraneous 标识，则标识该包不在 package.json 中。
$ npm prune
# 从 node_modules 中移除 extraneous 标识的包。
```

## `npx` 有什么用

`npx` 可以用来运行本地命令。所谓本地命令，指的是 `.\node_modules\.bin\` 目录中的命令。在此之前，如果想要直接运行本地命令，需要在 package.json 中运行。如过想要在系统终端上运行，需要指定 `.\node_modules\.bin\` 前缀，或者通过 `npm run <command>` 的方式调用 package.json 中的命令。

`npx` 还可以直接用来运行未安装的模块。因为 `npx` 默认会下载对应模块到缓存中。如果不想下载, 需提前指定 `--no-install` 参数。此外，如果想要强制下载（不使用本地模块）则可以使用  `--ignore-existing` 参数。安装的缓存路径可通过 `npm config get cache` 命令查看。
