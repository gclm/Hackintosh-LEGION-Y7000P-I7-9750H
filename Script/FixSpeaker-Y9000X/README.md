# FixSpeaker-Y9000X
- 项目源自 [YasuStudio](https://gitee.com/YasuStudio/fix-speaker-y9000x)
#### 更新记录
- 2022.01.16 [Sukka 提交PR](https://github.com/acidanthera/AppleALC/pull/755) 修复静音

#### 使用教程
修复y9000x Mac OS 扬声器教程：

- 1、下载AppleALC.kext放至kxet目录（本仓库下载，目前官方没有合并[修复静音](https://github.com/acidanthera/AppleALC/pull/755)），
OC引导`config.plist`配置文件`PciRoot(0x0)/Pci(0x1f,0x3)`项添加：
```
<key>layout-id</key>
<integer>66</integer>
<key>alc-verbs</key>
<data>AQAAAA==</data>
```

- 2、安装 ALCPlugFix-Swift 来修复扬声器切换异常问题, 终端使用以下命安装或卸载 ALCPlugFix
```bash
bash -c "$(curl -fsSL https://gitee.com/LoveGlaze/fix-speaker-y9000x/raw/master/FixSpeaker-Y9000X.sh)"
```

- 完成。

#### 特别感谢[Sukka](https://github.com/SukkaW)完成了大部分工作，我只是做了暂时整和。
#### 参考链接
https://github.com/thesofproject/linux/issues/2748

https://github.com/SukkaW/Lenovo-Y9000X-Hackintosh

https://gitee.com/xlivans/Tools

https://github.com/black-dragon74/ALCPlugFix-Swift
