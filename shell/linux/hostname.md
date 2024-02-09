可参考的文章:
- https://www.labno3.com/2021/08/04/using-the-hostname-command/
- https://blog.csdn.net/alwaysbefine/article/details/107638145 (四种修改方法)
- https://www.cnblogs.com/kerrycode/p/3595724.html

直接通过 hostname 修改的内容, 主机重启后就会失效。

主机名、主机号和IP地址是不一样的概念

临时修改的主机名, 需要在新会话中才会生效。
永久修改的主机号, 一般需要重启系统才生效

```bash
$ hostname # 查看主机名
$ hostname <new-hostname> # 修改主机名
$ hostname -i # 解析 "主机名" 的 IP 地址
$ hostname -I # 查看分配给系统网络接口的所有IP地址

```