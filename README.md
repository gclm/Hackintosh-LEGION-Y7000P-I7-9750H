# Hackintosh-LEGION-Y7000P-I7-9750H  
> 联想拯救者 Y7000P I7-9750H 准完美级 EFI

![Git Sync](https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/actions/workflows/Auto%20Gitee.yml/badge.svg)

## 电脑配置

```
电脑型号  联想 81T1
操作系统  Microsoft Windows 11 企业版 Insider Preview (64位)
CPU  (英特尔)Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz(2592 MHz)
主板  联想 LNVNB161216
内存  32.00 GB (   2667 MHz)
硬盘  Lenovo SSD SL700 480G
显卡  NVIDIA GeForce GTX 1650，核显 Intel(R) UHD Graphics 630
显示器  京东方 BOE HF 32位真彩色 144Hz
声卡  Realtek High Definition Audio
网卡  Intel(R) Wi-Fi 6 AX200 160MHz
```

## EFI 信息
- 配置: i7-9750H/UHD630/AX200
- 屏蔽 PM981 补丁
- 电源管理/蓝牙/WIFI 状态良好
- 触摸板支持多指操作
- 屏蔽独显，不支持 HDMI(以咨询过联想客服 HDMI、DP、Type-C 都是连接的独显)
- 支持 FN 热键，可以使用系统组合键调节亮度、声音等
- 有任何问题下方加群解决

## 项目结构

```shell
.
├── Clover       Clover引导（已过时）
├── LICENSE      开发协议
├── OpenCore     OC引导
├── README.md    说明文档
└── Script       修复补丁
```

## 更新日志

| 时间       | 版本 | 更新日志                                         |
| ---------- | ---- | -----------------------------------------------|
| 2019.12.09 | v1.0 | 发布第一版目前只支持 10.14.6,10.15.x 没进行测试   |
| 2019.12.28 | v1.1 | 进行了大量更新                                  |
| 2020.02.20 | v1.2 | 全面适配10.15.x(10.15.1、10.15.2、10.15.3)      |
| 2020.03.27 | v1.3 | 优化小太阳和小键盘驱动等问题                     |
| 2020.05.04 | v1.4 | 优化UI和更新相关依赖                            |
| 2020.10.11 | v1.6 | 优化UI和三码相关信息                            |
| 2021.01.31 | v2.0 | 新增OpenCore配置，支持11.x                      |
| 2021.09.26 | v2.1 | OpenCore 0.7.4，支持12beta7                    |
| 2021.10.15 | v2.3 | OpenCore 0.7.5，支持12beta10，自行编译蓝牙      |
| 2021.10.30 | v2.4 | OpenCore 0.7.5，支持Monterey，修复蓝牙问题      |

更新简介：
```
取消屏蔽nvme补丁(若有pm981(a)记得勾上屏蔽，不然会存在系统卡死),扫描策略更改为0
添加ACPI补丁，修复睡眠。
开启Linux支持，自动扫描Linux分区。
开启Booter-Quirks-SyncRuntimePermissions，解决Windows 11开启Hyper-v后OC引导Windows绿屏。
OC-0.73及之后兼容最低版本为big sur，引导旧版本需将UEFI-APFS-MinDate及MinVersion两项改为-1。
若遇到外接屏幕唤醒而内置黑屏时，可删减设备属性参数解决，因本人电脑问题，删减显卡注入参数后无法启动，有解决方法的可以群里给我帮助。
```
<img src='https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/1.png' height="200px" width="300px"><img src='https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/2.png' height="200px" width="300px"/>
![](https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/OpenCore.png)
![](https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/Windows.png)
![](https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/MacOS.png)
## 小键盘修复
github命令
```
sudo sh -c "$(curl -fsSL https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/raw/master/Script/Optimize.sh)"
```
gitee命令
```
sudo sh -c "$(curl -fsSL https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/raw/master/Script/Optimize.sh)"
```
## 反馈

- 反馈建议地址：<https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/issues>
- 交流 QQ 群：686834883<a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=fnfunVaG-Z_occpl9QQDNaHB-B4S-ole&jump_from=webapi"><img border="0" src="https://cdn.jsdelivr.net/gh/LoveGlaze/images@master/QQ.png" alt="Hackintosh" title="Hackintosh"></a>

## 关于

- Email：[gclm159@gmail.com](mailto:gclm159@gmail.com)
- Gitee:  [https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H](https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H)
- Github：<https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H>

**📣如果帮助到你了，请帮忙点亮[Github](https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H)右上角小星星，这将是我持续更新的动力！**

<img src='https://cdn.jsdelivr.net/gh/gclm/images@master/20191230923363Du7so.jpg' width="600px" />


