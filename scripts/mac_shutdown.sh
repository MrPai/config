#!/bin/bash
# https://www.jianshu.com/p/b65c1d339eec
# https://www.jianshu.com/p/4945a63b60a4
# https://stackoverflow.com/questions/24200924/run-a-script-only-at-shutdown-not-log-off-or-restart-on-mac-os-x

function shutdown(){
    # 关机用的脚本放这里
    # 由于关机时不能使用jq库，以下脚本不能在关机时自动运行
    cd /Users/zhulipai/zlp_workfiles/codes/mrpai/config
    make ACTION="delete" aliyun-dev-ecs
    exit 0
}

function startup()
{
    # 开机用的脚本放这里
    tail -f /dev/null &
    wait $!
}

trap shutdown SIGTERM
trap shutdown SIGKILL

startup;

# 查看开机自启任务
# launchctl list | grep mac

# launchctl unload com.mrpai.mac.shutdown.plist
# launchctl load com.mrpai.mac.shutdown.plist