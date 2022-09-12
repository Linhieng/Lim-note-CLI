## 🍕 npx 有什么用

npx 可以很方便的调用项目内部安装的模块。
在此之前，想要在终端命令行调用相关命令需要加上 `.\node_modules\.bin\` 前缀
但现在有了 npx, 就可以略该前缀。

当该模块不存在时, npx 默认会下载模块到 npx 缓存中,
如果不想默认下载, 可以加上 `--no-install` 参数。
反过来，如果想要强制下载（不使用本地模块）
则可以使用  `--ignore-existing` 参数

查看 npx 缓存所在目录:

  	npm config get cache

