# reg-text

## grep

grep (Global Regular Expression Print) 根据正则查找字符串并打印

在Shell脚本中，grep通过返回一个状态值来表示搜索的状态：

-   `0` 匹配成功。
-   `1` 匹配失败。
-   `2` 搜索的文件不存在。

```sh
grep [<option>] <reg> <file>
cat <file> | grep [<option>] <reg>
# 输出匹配内容所在行。比如
$ echo -e "\".\"\n'.'\n\"..\"" > test.txt
$ cat test.txt
"."
'.'
".."
$ grep "." test.txt
"."
'.'
".."
$ grep '.' test.txt
"."
'.'
".."
$ grep '"' test.txt
"."
".."
$ grep "'" test.txt
'.'



grep --line-number <reg> <file>
grep -n <reg> <file>
# 显示行号。比如
$ grep -n IdentityFile /etc/ssh/ssh_config
34:#   IdentityFile ~/.ssh/id_rsa
35:#   IdentityFile ~/.ssh/id_dsa
36:#   IdentityFile ~/.ssh/id_ecdsa
37:#   IdentityFile ~/.ssh/id_ed25519


grep --count <reg> <file>
grep -c <reg> <file>
# 输出匹配行的数量。比如
$ grep -c IdentityFile /etc/ssh/ssh_config
4


grep -e <reg> <file>
# 指定字符串做为查找文件内容的样式。比如
$ echo -e '-e\n-E\neee---e\n' > test.txt
$ cat test.txt
-e
-E
eee---e
$ grep -e -e test.txt
-e
eee---e


grep --extended-regexp <reg> <file>
grep -E <reg> <file>
# 将样式为延伸的正则表达式来使用。比如
$ echo -e "apple\nbanana\ncarrot" > test.txt
$ cat test.txt
apple
banana
carrot
$ grep -E 'app|rot' test.txt
apple
carrot


grep --fixed-regexp <str> <file>
grep -F <str> <file>
# 将样式视为固定字符串的列表。


grep --ignore-case <reg> <file>
grep --ignore <reg> <file>
grep -i <reg> <file>
# 匹配时忽略大小写


grep --invert-match <reg> <file>
grep -v <reg> <file>
# 反向匹配 / 输出不匹配的行


grep -r <reg> <folder>
grep -d recurse <reg> <folder>
# 指定要查找的是目录而非文件。比如
$ grep -r *.sh /etc
/etc/bashrc:    for i in /etc/profile.d/*.sh; do
/etc/profile:for i in /etc/profile.d/*.sh /etc/profile.d/sh.local ; do
/etc/NetworkManager/dispatcher.d/11-dhclient:    for f in $ETCDIR/dhclient.d/*.sh; do

```

## sed

sed是一种流编辑器，它是文本处理中非常中的工具，能够完美的配合正则表达式使用。

1. 处理时，把当前处理的行存储在临时缓冲区中，称为模式空间（pattern space）。
2. 接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。
3. 接着处理下一行，这样不断重复，直到文件末尾。

注意：

sed命令不会修改原文件，例如删除命令只表示某些行不打印输出，而不是从原文件中删去。
如果要改变源文件，需要使用 `-i` 选项。

## awk
## cut
## tr
