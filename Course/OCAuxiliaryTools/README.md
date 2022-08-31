# OpenCore-更新教程
写在前面的话:
```
本人比较懒，总不能OC一有更新就发布，毕竟开发版的话更新较快，在此写个教程方便各位自己更新
```
---
## 开始
#### 本教程使用的软件为OCAuxiliaryTools，该软件有Linux、Mac及Windows版本，操作方法一致。
### 准备工作：
- OCAuxiliaryTools
- 自己的EFI文件
- DiskGenius

  [![](https://img.shields.io/badge/DiskGenius-red)](https://www.diskgenius.cn/download.php)
  [![](https://img.shields.io/badge/EFI-grey)](https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H)
  [![](https://img.shields.io/badge/OCAuxiliaryTools-purple)](https://github.com/ic005k/OCAuxiliaryTools)

### 步骤
1) 解压并运行OCAuxiliaryTools

2) 将EFI复制到桌面，然后点击打开，选择EFI下的config.plist(也可以直接挂载，Mac下直接挂载比较方便)

   ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/2.png)  
3) 选择OC开发版或正式版

    1) 正式版：
       1) 点击升级OpenCore和Kexts按钮

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/3.png)  

       2) 选择最新版，点击获取OpenCore后点击开始同步

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/3.1.png)  
    2) 开发版：
       1) 点击编辑，点击勾选OpenCore开发版
       
       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/3.2.png)  
       2) 点击升级OpenCore和Kexts按钮,选择开发版分支后点获取并点同步，更新Kext也如下所示(开发版根据自己需要勾选)

       ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/3.3.png)  
       
4) OCAT会提示红色感叹号，只需要上述同步完成后点击感叹号旁边的保存按钮即可

   ![](https://cdn.staticaly.com/gh/LoveGlaze/images/master/OCAuxiliaryTools/4.png)  
   - 注：若保存后依旧红色感叹号，可点击感叹号根据提示修改配置文件
6) 点击保存后无误即OC更新成功(保存会自动保存旧配置，遇到错误重命名即可)

