# Linux 相关命令

这里的内容主要是 Linux 系统上提供的相关命令，而不是 shell 的学习。

## 区域设置（编码）

`locale` 可以获取区域相关信息，比如字符编码和时间格式等等。

常用语法：

```syntax
locale [<option>]
```

直接执行 `locale` 会输出和区域有关的变量，比如 `LANG` 变量。该变量表示系统语言使用的字符编码。（（注意 Linux 上环境变量区分大小写）

通过 `locale -m` 或 `locale --charmaps` 可以查看所有可用的编码，比如 ASCII, BIG5, GB2312, GBK, UTF-8 等等。更多配置项可通过 `locale -h` 获取。

Window 上通过 `chcp` 来修改当前终端字符集，而 Linux 上可以通过 `LANG` 变量实现类似的效果。比如 `export LANG=C.gb2312` 可以临时修改字符编码。
