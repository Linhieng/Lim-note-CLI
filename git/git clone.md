## 相关命令说明

```bash

$ git clone <https-url>
# 克隆远程端的一个仓库。

$ git clone [--depth=<number>] <https-url>
# 有时候项目太大，可以进行浅克隆，比如：
# git clone --depth=1 https://github.com/microsoft/TypeScript.git

$ git clone -b <branch-name> <https-url>
# 克隆指定分支，注意分支需要区分大小写。

$ git clone -c http.proxy=<proxy-url> <https-url>
# 使用代理进行克隆。
# <proxy-url> 示例：http.proxy="127.0.0.1:7890"

```

## `--shallow-since` 克隆某个时间点之后的内容

```sh
$ git clone --shallow-since="1 week" <url>
# 克隆最近一周的
# 如果提示 fatal: error processing shallow info: 4，则可能是因为对应日期之后，没有提交内容。

$ git clone --shallow-since="2023-09-06" <url>
# 克隆 2023-09-06 日之后的
```
