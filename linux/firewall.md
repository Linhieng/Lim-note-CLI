> [参考文章](https://www.jianshu.com/p/e0fdecfcee4b)

## 🍕 常用命令

- 查看开放了哪些端口

      firewall-cmd --list-ports

    或

      firewall-cmd --zone=public --list-ports

- 开放端口

  ```bash
  firewall-cmd --zone=public --add-port=<PORT>/tcp # 重启失效
  firewall-cmd --zone=public --add-port=<PORT>/tcp --permanent #　永久生效
  ```

- 关闭端口

  ```bash
  firewall-cmd --zone=public --remove-port=<PORT>/tcp # 重启失效
  firewall-cmd --zone=public --remove-port=<PORT>/tcp --permanent # 永久生效
  ```

## 🍕 其他 firewall-cmd 命令


- 查看防火墙是否在运行

      firewall-cmd --state


- 可以查看防火墙相关信息

      firewall-cmd --list-all


- 重新加载防火墙

      firewall-cmd --reload

- 查看防火墙开启的服务

      firewall-cmd --list-services

- 永久开启一个 http 服务

      firewall-cmd --permanent --add-service=http

- 查看是否拒绝所有包

      firewall-cmd --query-panic

- 拒接所有包（将会断开连接）

      firewall-cmd --panic-on

- 关闭拒接所有包（无法连接时使用 VNC 连接）

      firewall-cmd --panic-off

## 🍕 其他 systemctl 命令

- 启动防火墙

      systemctl start firewalld

- 关闭防火墙

      systemctl stop firewalld

- 查看防火墙 status

      systemctl status firewalld

- 查看 firewalld 是否开启自启

      systemctl is-enabled firewalld

- 设置 firewalld 开启自启

      systemctl enable firewalld.service

- 设置 firewalld 关闭自启

      systemctl disable firewalld.service