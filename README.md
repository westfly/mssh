mssh
===
 依赖 
---

mssh 是一个基于[pssh](https://github.com/westfly/pssh) 的工具，相当于原始的pssh添加了输入密码功能，所以需要[sshpass](http://sourceforge.net/projects/sshpass/)的支持。

在bin下的是通过sshpass源码编译出来的，需要更加自己的系统编译出来，替换即可。

 安装 
---

下载之，将bin目录添加到系统的 ~/.bashrc下即可

```
export PATH=$PATH:/home/westfly/mssh/bin
```

 用法 
---
需要定义一个多机的文件，如mssh.dat
```
10.139.34.50
10.139.34.52
10.139.34.54
```

修改run_ssh.sh 中的登陆名列表和密码列表

执行命令即可

```
sh run_ssh.sh mssh.dat "ls"
```

最后的命令，需要用引号括起来，否则可能出错。

祝君好运。

 TODO 
---
1. 添加scp的支持，当前是可以通过ssh 模拟的（用rsync），但依然不方便
2. 支持免密码登陆的ssh方式

