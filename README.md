# Monero Mining Script

2024年9月18日

直接运行script.sh即可，也可以修改里面的钱包地址，来将矿池收益转给指定的钱包地址。
需要安装的挖矿xmrig软件，已经内置在文件夹中，全部下载后，运行脚本就会自动找到指定的软件了。

This repository contains a bash script for setting up Monero mining using the `xmrig` miner. Test on ARM (Pi4) systems and AMD systems.

Create monero wallet >> https://www.getmonero.org/downloads/ <br>
How to get wallet address >> https://youtube.com/clip/UgkxSWt49IkdTOb6ODT9u-623PHsPD8fCOIe
<br>
<br>
<img src="https://github.com/SathiraSriSathsara/monero-mining-script/blob/main/ss.png">

## Prerequisites

Before running the script, ensure that you have the following dependencies installed:

- `git`
- `build-essential`
- `cmake`
- `libuv1-dev`
- `libssl-dev`
- `libhwloc-dev`

## Installation

Clone repository

```shell
git clone https://github.com/SathiraSriSathsara/monero-mining-script.git
```

Run the script for first time

```shell
 cd monero-mining-script
 sudo apt-get install dos2unix
 dos2unix ./run.sh
 sudo chmod 777 *
 ./run.sh
```

Run the script 24/7


```shell
 dos2unix ./script.sh
 sudo chmod 777 *
 ./script.sh
```

## Contributing

If you find any issues or have suggestions for improvement, please feel free to open an issue or submit a pull request.


<br>

💬 If you have any problems contact me via discord : SaM ™#9353

📞 Discord server : https://discord.gg/TRYZMZsQWF

🗣️ Teamspeak : ts.enforcers.lk

🌐 Website : https://www.enforcers.lk/

<br>

<div align="center">
	<img src="https://github.com/SathiraSriSathsara/SathiraSriSathsara/blob/main/icon.png" width="40">
	<h4>Sathira Sri Sathsara @ 2023</h4>
</div>	



