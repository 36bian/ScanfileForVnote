# scanVnoteMissFiles
#### 平台
mac上使用通过，linux没试
#### 介绍
绕过vnote直接添加的文件，vnote无法显示（意外丢了文件的也在此列）  
vnote目前没提供扫描文件夹重新生成json的功能，自己写了个脚本
#### 使用方法
1. 修改代码中的文件路径，默认只支持扫描`*md`文件，根据需要修改代码第20、22行
2. 下载文件，运行`zsh scan_missing_file.sh`
#### 效果图
 <img src="https://s1.ax1x.com/2020/04/30/JL4Mpq.md.png" width = "300" alt="图片名称" align=center />
