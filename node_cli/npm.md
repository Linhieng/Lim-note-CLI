## 🍕 常见参数

full name    | aliases | 介绍说明
-------------|---------|------------------
--global     | -g      | 全局安装
--save       | -S      | 默认会有
--save-dev   | -D      | 需指定
--save-exact | -E      | 固定版本, 版本号没有 `^` 和 `~`

## 🍕 未分类的命令

- 根据 `package-lock.json` 指定的版本安装所有依赖

    	npm ci

  必须存在 `package-lock.json` 文件, 这是一种相对 `npm i` 更安全的安装方式


- 初始化项目

    	npm init [-y]

  带上 `-y` 参数代表遇到选择时默认 yes

- 查看安装的包

    	npm (ls | list) [-g] [--depth 0]

  查看安装的包, 默认深度为 0, 只查看第一层, 不输出全部。
	输出中的 `extraneous` 标识, 代表该包不在 `package.json` 中。

- 移除 `extraneous` 标识的包。

	    npm prune

-

## 🍕 npm config

### 参考

- [概览](https://docs.npmjs.com/cli/v8/commands/npm-config)
- [详细](https://docs.npmjs.com/cli/v8/using-npm/config/)
- [registry 源](https://docs.npmjs.com/cli/v8/using-npm/registry)

### 语法

```bash
    npm (config | c) set <key>=<value> [<key>=<value> ...] # 增加配置
    npm (config | c) get [<key> [<key> ...]] # 查看值
    npm (config | c) delete <key> [<key> ...] # 删除配置
    npm (config | c) list [--json] # 配置列表
    npm (config | c) edit # 编辑配置列表
```

### 示例 🌰

- 配置 "下载源"

  ```bash
  npm config set registry <url>
  npm config set registry https://registry.npm.taobao.org # 淘宝源
  npm config set registry https://registry.npmmirror.com # 国内源
  npm config set registry https://registry.npmjs.org # 默认源
  ```

- 配置代理

  ```bash
  npm config set proxy <url>
  npm config set proxy http://127.0.0.1:7890 # 配置本地 clash 代理
  ```

- 查看全局安装包(node_global)的所在路径

      npm config get prefix

- 查看全局缓存(node_cache)的所在路径

      npm config get cache

- 修改默认 `package.json` 中的 `author`

      npm c set init-author-name "Linhieng"

- 修改默认 `package.json` 中的 `version`

      npm c set init-version "0.0.1"
