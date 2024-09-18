#!/bin/bash

# 混淆变量名
e="echo"
u="sudo"
i="apt-get"
a="update"
t="install"
r="screen"

# 更新系统包列表
$e "更新系统包列表..."
$u $i $a

# 安装 screen
$e "安装 screen..."
$u $i $t -y $r

# 确保脚本文件具有执行权限
chmod +x "$0"

# 预定义的钱包地址
s="4BCJ4xYzj3nXPDkGuEdxo3AfNxyMsPNi6S1Yzh3GGdQYaJKEQSJvdRM4672yzTxPu1Vahs7WgGLJrJY5r9ziVVg6D4STLdp"

# 选择是否使用预定义的钱包地址（回车默认为“yes”）
$e "你可以选择使用以下预定义的钱包地址，或输入新的钱包地址。"
$e "预定义的钱包地址: $s"
read -p "是否使用预定义地址？（回车默认为yes, 输入no使用新地址）： " u_s

# 如果用户没有输入内容，则默认选择“yes”
if [ -z "$u_s" ]; then
    u_s="yes"
fi

if [[ "$u_s" == "yes" ]]; then
    w=$s
else
    read -p "请输入你的钱包地址: " w
fi

# 提示输入工作名称
read -p "请输入工作名称: " n

# 切换到 xmrig 目录
cd xmrig-6.22.0 || { $e "切换到 xmrig-6.22.0 目录失败"; exit 1; }

# 确保 xmrig 文件具有执行权限
chmod +x xmrig

# 使用 screen 和 nice 运行 xmrig，将优先级设置为最低
# -n 19 表示设置最低优先级，范围从 -20（最高优先级）到 19（最低优先级）
screen -S mine -d -m nice -n 19 ./xmrig -o gulf.moneroocean.stream:10128 -u $w -p $n

# 提示用户 screen 会话已经启动
$e "xmrig 已经在名为 'mine' 的 screen 会话中启动，并且 CPU 优先级已被设置为最低。"
