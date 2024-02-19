# 文本处理

## cat

用于查看内容较少的纯文本文件。

```sh
cat <file>
# 查看文件内容

cat /dev/null > <file>
# 清空文件内容


cat <file> -n
cat <file> --number
# 输出行号

cat <file> -b
cat <file> --number-nonblank
# 输出行号，但是不对空白行进行编号

cat <file> -s
cat <file> --squeeze-blank
# 当遇到有连续两行以上的空白行，只输出一行的空白行

cat <file> -ns
# 当遇到有连续两行以上的空白行，只输出一行的空白行。然后进行编号

cat <file> -bs
# 当遇到有连续两行以上的空白行，只输出一行的空白行。然后对非空白行进行编号

```


## more

从前向后分页显示文件内容。

| hotkey              | info |
| ------------------- | ---- |
| `Enter`             |      | 向下 n 行，n 需要定义，默认为 1 行
| `Ctrl+F` /  `Space` |      | 向下滚动一页
| `Ctrl+B`            |      | 向上滚动一页
| `=`                 |      | 输出当前行的行号
| `!<command>`        |      | 执行 `<command>`
| `q`                 |      | 退出

案例：

```sh
more +20 /var/log/messages
# 从第 20 行开始分页查看系统日志文件 /var/log/messages。
```

## less

与 `more` 命令相似，但使用 `less` 可以随意浏览文件，而 `more` 仅能向前移动，却不能向后移动。


| hotkey           | info |
| ---------------- | ---- |
| `/<str>`         |      | 向下搜索字符串
| `?<str>`         |      | 向上搜索字符串
| `n`              |      | 重复前一个搜索
| `N`              |      | 反向重复前一个搜索
| `b` / `PgUp`     |      | 向上翻一页
| `space` / `PgDn` |      | 向下翻一页
| `u`              |      | 向前翻半页
| `d`              |      | 向后翻半页
| `y`              |      | 向前滚动一行
| `Enter`          |      | 向后滚动一行
| `q`              |      | 退出

```sh

less -e	 <file>
# 当文件显示结束后，自动离开

less -m	 <file>
# 显示类似 more 命令的百分比

less -N	 <file>
# 显示每行的行号

less -s	 <file>
# 显示连续空行为一行

less +10 -Nm <file>
# 从第 10 行开始，并且显示行号和百分比
```


## head

用于查看文件开头指定行数的内容。


```sh
head <file>
# 显示前 10 行内容

head <file> -n <line-number>
# 显示开头指定行数的文件内容

head <file> -c <char-number>
# 显示开头指定个数的字符数

head <file1> <file2> -n 4
# 显示多个文件内容，并且只显示前 4 行

head <file1> <file2> -q
# 显示多文件时，不显示文件名字信息

cat -n <file> | head -n <line-number>
# 显示开头指定行数和行好

```

## tail

用于查看文档的后N行或持续刷新内容。

```sh
tail <file>
# 显示文件末尾 10 行

tail <file> -n <line-number>
# 显示文件末尾指定行数

tail <file> -c <char-number>
# 显示文件的尾部特定个字节内容

tail <file1> <file2> -q
# 当有多个文件参数时，不输出各个文件名

tail <file> -v
# 总是输出文件名

tail <file> -f
# 实时追踪文件最新内容！
# ctrl+c 可退出

tail -f -n 2 /var/log/messages
# 查看 /var/log/messages 系统日志文件的最新 2 行，并保持实时刷新。


cat -n <file> | tail -n <line-number>
# 显示文件末尾指定行首和行号
```


## stat

用来显示文件的详细信息(元信息)，比如

-   inode 索引节点（Linux 中文件的唯一标识）
-   Access 权限
-   atime 访问时间
-   mtime 修改时间
-   ctime 状态更改时间

```sh
stat <file>
```


## wc

用于统计指定文本的行数、字数、字节数。


```sh
wc <file> -l
# 只显示行数

wc <file> -w
# 只显示单词数

wc <file> -c
# 只显示字符数

wc <file> -cwl
# 依次输出：行数、单词数、字符数
```

## file

用于辨识文件类型

```sh
file <file>
# 查看文件类型。如
#   directory
#   ASCII text
#   HTML document, ASCII text, with very long lines
#   HTML document, UTF-8 Unicode text, with CRLF line terminators
#   sbin: symbolic link to usr/sbin

file <file> -b
# 列出辨识结果时，不显示文件名称

file <file> -c
# 详细显示指令执行过程，便于排错或分析程序执行的情形

file <file> -L
# 直接显示符号连接所指向的文件类别，如 file /sbin -L 则直接显示 directory

file <file> -f <my-magic-file>
# 使用自定义 magic 文件，来解析文件类型
# 未尝试过！
```


## diff

用于比较文件的差异。

```sh
diff <file1> <file2>
# 比较文件差异。

# 举例：
$ echo -e '第一行\n第二行\n我是log1第3行\n第四行\n第五行\n第六行' > 1.log
$ cat 1.log
第一行
第二行
我是log1第3行
第四行
第五行
第六行
$ echo -e '第一行\n第二行\n我是log2第3行\n第四行' > 2.log
第一行
第二行
我是log2第3行
第四行
$ diff 1.log 2.log
3c3
< 我是log1第3行
---
> 我是log2第3行
5,6d4
< 第五行
< 第六行
# 对比结果中的 3c3 表示两个文件在第3行有不同，
# 5,6d4 表示 2.log 文件相比 1.log 文件在第 4 行处开始少了 1.log 文件的第 5 和第 6 行。

# ------------ 举例完毕
```
