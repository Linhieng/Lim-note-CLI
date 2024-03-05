## 语法

```sh
npm (c | config) set            <key>=<value> [<key>=<value> ...]   # 添加/修改配置
npm (c | config) get            [<key> [<key> ...]]                 # 查看配置
npm (c | config) delete         <key>   [<key> ...]                 # 删除配置
npm (c | config) (list | ls)    [--json] [-l | -long]               # 查看配置列表
npm (c | config) edit                                               # 直接编辑配置文件
npm (c | config) fix                                                # 尝试修复无效的配置项
```

示例：
```sh
$ npm config list
# 输出自定义的配置项信息

$ npm config list -long
# 查看所有有效值（默认配置、自定义的配置）。
```

## 常用的 key

初始化项目时的 key  | 说明
--------------------|---
`init-author-name`  |
`init-author-email` |
`init-author-url`   |
`init-license`      |
`init-version`      |
`init-module`       | 一个路径值，默认是 `~/.npm-init.js`

### 有关下载 npm 包相关的 key

- `registry`
    - 配置镜像地址。拥有代理的情况下不建议修改镜像地址。
    - 曾经收集的地址：
        - 默认源 `https://registry.npmjs.org`
        - 淘宝源 `https://registry.npmmirror.com`
        - 腾讯源 `https://mirrors.cloud.tencent.com/npm/`
        - 华为源 `https://mirrors.huaweicloud.com/repository/npm/`
- `proxy`
    - 配置代理，建议结合 clash 使用。
    - 比如：`npm config set proxy http://127.0.0.1:7890`

- `prefix`
    - 全局安装时的安装路径（node_global）

- `cache`
    - 全局缓存的路径（node_cache）
