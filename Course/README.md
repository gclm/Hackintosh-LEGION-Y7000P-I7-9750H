# Hackintosh-LEGION-Y7000P-安装教程
写在前面的话:
```
在大多数情况下，所有基于SATA的驱动器均受支持，大多数NVMe驱动器也受支持。只有少数例外：
· 三星PM981(a) / PM991和美光2200S NVMe SSD
· 这些固态硬盘不兼容（导致内核崩溃），因此需要NVMeFix.kext来修复这些内核崩溃。请注意，即使使用NVMeFix.kext，这些驱动器仍可能会导致启动问题。
· 与此相关的是，三星970 EVO Plus NVMe SSD也有同样的问题，但已在固件更新中得到修复。可在此处获取固件更新（通过Samsung Magician或可启动ISO的Windows）。
· 还要注意，macOS不支持使用Intel傲腾(Optane Memory)或Micron 3D XPoint进行HDD加速的笔记本电脑。一些用户报告说在Catalina取得了成功，甚至具有读写支持，但我们强烈建议您卸下驱动器以防止任何潜在的启动问题。
本教程以Y7000为模板，其他机型可参考替换自己的EFI(请认真阅读其中的屏蔽说明)
```
---
## 开始
#### 本教程为直装教程，确保WiFi及EFI可用的情况下，可采用在线安装教程
#### 三星PM981(a)系列可采用恢复安装10.15.7，并且打上NVMeFix.kext驱动
[![](https://img.shields.io/badge/在线安装-blue)](#在线安装)
[![](https://img.shields.io/badge/恢复安装-red)](#恢复安装)
### 准备工作：
- U盘：大于等于16GB的U盘
- 镜像：macOS 原版镜像
- 工具：Etcher（刻录镜像）、DiskGenius（分区）、EFI驱动文件、EasyUEFI（引导）

- 下载地址：镜像下载地址用户名Extreigionor及密码Password 百度网盘可采用油猴脚本[加速教程](https://github.com/LoveGlaze/BaiduNetdiskTools)
- [![](https://img.shields.io/badge/Etcher-green)](https://www.balena.io/etcher)
  [![](https://img.shields.io/badge/DiskGenius-red)](https://www.diskgenius.cn/download.php)
  [![](https://img.shields.io/badge/EFI-grey)](https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H)
  [![](https://img.shields.io/badge/镜像-blue)](http://imacos.top/hpgw/xtgx/gfyb/)
  [![](https://img.shields.io/badge/MyHash-yellow)](https://lovekevin.top/%E5%90%84%E7%A7%8D%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/MyHash.7z)
  [![](https://img.shields.io/badge/EasyUEFI-purple)](https://lovekevin.top/%E5%90%84%E7%A7%8D%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/EasyUEFI.zip)

### 安装步骤
1) 本仓库EFI屏蔽说明
    ```
   默认配置为19款，若19款无法使用，可更名另外两款为config.plist。
   此EFI默认屏蔽nvme(pm981)硬盘，
   若安装盘为非pm981的nvme硬盘或电脑不存在pm981硬盘可取消屏蔽，
   方法：记事本打开config.plist，将第13行（SSDT-DNVMe.aml头上）的true改为false即可。
    ```
 
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/DNVMe.png)
   ```json
   警告：若电脑存在PM981(a)系列硬盘但是未屏蔽，系统则会随机卡死！！！
   ```
2) 镜像下载后，用刚才下载的MyHash检查md5值是否正确，如果md5值不相同须重新下载

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/MD5.png)
3) 将U盘以默认设置格式化一遍

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/U.png)
4) 下载Etcher，选择安装镜像，选择需要制作的U盘，点击 Flash 即可。Windows10需要以管理员权限运行

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/Etcher.png)
5) 刻录成功如下图显示

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/Etcher2.png)
6) 将镜像分区自带的EFI删除，(一般现在的镜像都是三分区，根据需要替换就行，这里替换其中的OC分区)

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/OC1.png)
7) 把自己准备好的EFI复制过去

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/OC2.png)
8) 设置BIOS，开机按F2进入Bios将安全启动关闭

   ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/AQ.jpg)
9) 下载[Bios一键修改](https://lovekevin.top/%E5%90%84%E7%A7%8D%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/Y7000%E7%B3%BB%E5%88%97%E4%B8%80%E9%94%AE%E4%BF%AE%E6%94%B9BIOS.zip)，运行5、6、7、8，8代处理器还需运行4
   
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/Bios.png)  
    
   1) 显卡切换混合模式，打开联想电脑管家，点击右上角游戏模式

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/XK1.png)  
    
   2) 点击显卡模式，选择混合模式
   
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/XK2.png)  
    
   3) 若没有安装联想电脑管家，可开机连续点按F2进入BIOS设置，切换显卡模式
   
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/XK3.jpg)  
10) 安装macOS Monterey
    1) 开机，按F12选择U盘引导，光标移动到EFI USB Device选择OpenCore分区启动：
    2) 进入OpenCore主引导界面，选择Install macOS Monterey，回车进入安装，如果不幸卡住了，请到QQ群寻求帮助

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/install.png)
11) 选择简体中文，点击->继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/ZW.png)
12) 出现安装界面，选择磁盘工具，点击继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C1.png)
13) 进入磁盘工具，点击下图所示，选择显示所有设备

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C2.png)
    - 在磁盘工具里面所做的操作涉及到你的数据安全，请认真仔细确认后再操作，否则由此造成的一切后果本站概不负责
14) 请根据你的设备选择相应的磁盘，点击抹掉，在弹出的窗口中输入：(名称自定义)

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C3.png)
15) 点击抹除，然后等待操作结束，通过菜单选择退出磁盘工具或者按窗口左上角红色按钮离开磁盘工具

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C4.png)
16) 返回到安装界面，选择安装macOS，点击继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C5.png)
17) 点击同意，继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C6.png)
18) 阅读许可协议的条款，点击 同意

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C7.png)
19) 选择将要安装的磁盘卷标MacOS，点击继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C8.png)
    - 它会把USB安装盘上的安装文件预复制到要安装的系统分区里，这个过程通常会持续1-2分钟，之后系统会自动重启
20) 重启后继续安装，在安装期间，通常会自动重启2-3遍

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C9.png)
21) 自动重启进入第二阶段安装

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C10.png)
    - 安装Monterey的时间通常是安装Catalina的2倍，请务必耐心等待；安装完成后，会进入设置向导
22) 选择国家和地区，拉到最底，选择：中国大陆，点击继续

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C11.png)
23) 出现桌面后，整个的安装向导就完成了。

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C12.png)
24) 系统安装后，你可以先喝杯咖啡兴奋会儿，马上还有更艰巨的任务在等着你呢
    - 先打开终端，输入命令：
    ```
    sudo spctl --master-disable    # 启用macOS安装应用允许任何来源
    ```
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C13.png)
25) 运行小键盘及声音修复等
    - 打开终端，输入命令，根据需要选择修复
    ```
    sudo sh -c "$(curl -fsSL https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/raw/master/Script/Optimize.sh)"
    ```
    - 运行后输入0退出修复，输入open /usr/local
    - 打开 系统偏好设置 > 安全性与隐私 > 隐私 > 辅助功能
    - 将 setleds ALCPlugFix等拖放到辅助功能
    
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/C14.png)  
26) Y9000X扬声器无声修复
    - 打开终端输入以下命令
    ```
    sudo sh -c "$(curl -fsSL https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/raw/master/Script/FixSpeaker-Y9000X/FixSpeaker-Y9000X.sh)"
    ```
    - 在OC引导`config.plist`配置文件`PciRoot(0x0)/Pci(0x1f,0x3)`项添加：
    ```
    <key>layout-id</key>
    <integer>66</integer>
    <key>alc-verbs</key>
    <data>AQAAAA==</data>
    ```
27) 系统可以成功启动后，接下来就是将EFI复制到硬盘
    1) 如果电脑有两块硬盘，可直接将EFI复制到第二块硬盘的ESP分区即可
    2) 如果电脑只有一块硬盘，则需要手动添加引导项
       1) 打开DiskGenius，将EFI->OC复制到ESP->EFI下     
          
       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/E1.png)  
    
       2) 打开EasyUEFI，点击管理EFI启动，点击图中位置+号添加启动项

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/E2.png)  
    
       3) 选择Linux及其他操作系统，描述自定义，选择硬盘ESP分区，然后点击浏览文件

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/E3.png)  
    
       4) 选择EFI->OC->OpenCore.efi，确定

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/E4.png)  
    
       5) 选中刚刚添加的启动项，点击向上箭头，移到第一启动项，重启即可进入OC

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/E5.png)  
    - 若重启第一启动项不是OC，可手动进入BIOS调整启动顺序

---
## 在线安装
### MacRecovery
- 项目来自[OpenCorePkg](https://github.com/acidanthera/OpenCorePkg)官方文档，编译py文件为exe，参数写入bat文件方便使用。

- [![Push exe To Releases](https://github.com/LoveGlaze/MacRecovery/actions/workflows/Auto%20py%20to%20exe.yml/badge.svg?branch=master)](https://github.com/LoveGlaze/MacRecovery/actions/workflows/Auto%20py%20to%20exe.yml)

MacRecovery-黑果在线安装工具
将U盘格式化为fat32格式(也可在硬盘建立一个800MB的Fat32格式分区)
1) 下载[Release](https://github.com/LoveGlaze/MacRecovery/releases/download/MacRecovery/MacRecovery.zip)里的压缩文件，解压运行选择需要的版本
 
2) 将生成的com.apple.recovery.boot复制到U盘根目录，并将你的EFI目录拷贝到U盘根目录
 
3) 重启，选择recovery即可进入恢复安装模式。
 
4) 若看不到U盘的recovery恢复选项，可以通过修改EFI/OC/config.plist配置文件解决：
   1) Misc --> Security --> ScanPolicy  修改为0

5) 在线安装必须保证你的OC配置里能正常驱动有线或无线网卡，如无网络，请还是用完整安装镜吧。

6) 在线安装速度慢的话，可以将DNS修改为114.114.114.114
- [联想拯救者Y7000P-2019-EFI](https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H)
  
    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/MacRecovery.png)

---
## 恢复安装
### 准备

[![](https://img.shields.io/badge/Paragon%20Hard%20Disk%20Manager%2017下载-blue)](https://lovekevin.top/%E5%90%84%E7%A7%8D%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/Paragon%20Hard%20Disk%20Manager%2017%20Advanced%2017.13.1.rar)
[![](https://img.shields.io/badge/恢复镜像下载-blue)](http://imacos.top/hpgw/xtgx/hfb/)

### 开始安装
1) 安装Paragon Hard Disk Manager 17



2) 打开Paragon Hard Disk Manager，选择从文件恢复

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P1.png)
3) 选择恢复，弹出窗口选择恢复文件，输入密码进入下一步

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P2.png)
4) 选择目的磁盘

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P3.png)
5) 选择目标分区

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P4.png)
6) 点击开始恢复

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P5.png)
7) 任选其一，第一个校验，第二个不校验直接恢复

    ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/Course/P6.png)

