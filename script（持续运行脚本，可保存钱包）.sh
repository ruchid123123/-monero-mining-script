#!/bin/bash

# 更新系统包列表
echo "更新系统包列表..."
sudo apt-get update

# 安装 screen
echo "安装 screen..."
sudo apt-get install -y screen

# 确保脚本文件具有执行权限
chmod +x "$0"

# 预定义的钱包地址
saved_wallet_address="4BCJ4xYzj3nXPDkGuEdxo3AfNxyMsPNi6S1Yzh3GGdQYaJKEQSJvdRM4672yzTxPu1Vahs7WgGLJrJY5r9ziVVg6D4STLdp"

# 选择是否使用预定义的钱包地址（回车默认为“yes”）
echo "你可以选择使用以下预定义的钱包地址，或输入新的钱包地址。"
echo "预定义的钱包地址: $saved_wallet_address"
read -p "是否使用预定义地址？（回车默认为yes, 输入no使用新地址）： " use_saved_address

# 如果用户没有输入内容，则默认选择“yes”
if [ -z "$use_saved_address" ]; then
    use_saved_address="yes"
fi

if [[ "$use_saved_address" == "yes" ]]; then
    wallet_address=$saved_wallet_address
else
    read -p "请输入你的钱包地址: " wallet_address
fi

# 提示输入工作名称
read -p "请输入工作名称: " name

# 切换到 xmrig 目录
cd xmrig-6.22.0 || { echo "切换到 xmrig-6.22.0 目录失败"; exit 1; }

# 确保 xmrig 文件具有执行权限
chmod +x xmrig

# 使用 screen 和 nice 运行 xmrig，将优先级设置为最低
# -n 19 表示设置最低优先级，范围从 -20（最高优先级）到 19（最低优先级）
screen -S mine -d -m nice -n 19 ./xmrig -o gulf.moneroocean.stream:10128 -u $wallet_address -p $name

# 提示用户 screen 会话已经启动
echo "xmrig 已经在名为 'mine' 的 screen 会话中启动，并且 CPU 优先级已被设置为最低。"
