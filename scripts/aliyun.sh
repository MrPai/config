#!/usr/bin/env bash

## 启动阿里云
## https://help.aliyun.com/document_detail/110848.html
## https://github.com/aliyun/aliyun-cli/blob/master/README-CN.md

set -e

ACTION=${ACTION:-DescribeInstances};
INSTANCENAME=ali_dev;
function main() {
    case $ACTION in
        DescribeInstances)
            DescribeInstances
            ;;
        create)
            create
            ;;
        delete) delete
            ;;
        modify_release_time) modify_release_time
            ;;
        help) echo "help"
            ;;
    esac
}

function create() {
    InstanceId=$(CreateInstance)
    printf "\n CreateInstance: ${InstanceId} \n"
    sleep 1
    IpAddress=$(AllocatePublicIpAddress $InstanceId)
    printf "\n AllocatePublicIpAddress: ${IpAddress} \n"
    replace_ssh_config $IpAddress

    sleep 7
    RequestId=$(StartInstance $InstanceId)
    printf "\n StartInstance \n"
    sleep 5
    Modify=$(ModifyInstanceAutoReleaseTime $InstanceId)
    printf "\n ModifyInstanceAutoReleaseTime \n"
}

function delete() {
    InstanceId=$(DescribeInstances)
    printf "\n DescribeInstances: ${InstanceId} \n"
    RequestId=$(DeleteInstance $InstanceId)
    printf "\n DeleteInstance \n"

    rm -f ~/.ssh/known_hosts*
}

function modify_release_time() {
    InstanceId=$(DescribeInstances)
    printf "\n DescribeInstances: ${InstanceId} \n"
    sleep 3
    RequestId=$(ModifyInstanceAutoReleaseTime $InstanceId)
    printf "\n ModifyInstanceAutoReleaseTime \n"

    # rm -f ~/.ssh/known_hosts*
}

function replace_ssh_config(){
    # sed -i '' 's/HostName.*$/HostName 47.242.123.47/g' ~/.ssh/config && rm -f ~/.ssh/known_hosts*
    ip="$1"
    old=$(awk "/Host ali_dev/{getline a;print a}" $HOME/.ssh/config)
    sed -i "" "s/$old/HostName $ip/g" $HOME/.ssh/config
}

function CreateInstance() {
    # curl -s https://api.coincap.io/v2/assets/kusama | jq '.data.priceUsd'

    # 创建实例
    # https://help.aliyun.com/document_detail/25499.html
    aliyun ecs CreateInstance \
        --InstanceName $INSTANCENAME \
        --ImageId m-j6cbcpswexaigikr3q30 \
        --InstanceType ecs.c6.2xlarge \
        --SecurityGroupId sg-j6ccjzmccsdd0yfbjjvv \
        --VSwitchId vsw-j6cxm6w8ek0yyid0tk16j \
        --InternetChargeType PayByBandwidth \
        --InternetMaxBandwidthOut 3 \
        --SystemDisk.Size 40 \
        --InstanceChargeType PostPaid \
        --KeyPairName ali_dev | jq -r '.InstanceId'
}

function AllocatePublicIpAddress() {
    id="$1"
    # 分配公网IP
    # https://help.aliyun.com/document_detail/25544.html
    aliyun ecs AllocatePublicIpAddress --InstanceId $id  | jq -r '.IpAddress'
    # ```
    # {
    # 	"IpAddress": "47.243.178.128",
    # 	"RequestId": "F3F7CC43-BEB4-3363-9646-908BECAC3EE5"
    # }
    # ```
}

function StartInstance() {
    id="$1"
    # 启动实例
    # https://help.aliyun.com/document_detail/155374.html
    aliyun ecs StartInstance --InstanceId $id
    # ```
    # {
    # 	"RequestId": "06BE373A-F5BD-3767-B97F-A292616ACD05"
    # }
    # ```
}

function DescribeInstances(){
    # 查看实例
    # https://help.aliyun.com/document_detail/25506.html
    # 加上 -r ，使结果不带双引号
    aliyun ecs DescribeInstances --InstanceName $INSTANCENAME | jq -r '.Instances.Instance[].InstanceId'
}

function StopInstance(){
    # 停止实例
    # https://help.aliyun.com/document_detail/155372.html
    aliyun ecs StopInstance --InstanceId i-j6c0q4b3lxkd3xsw32lm
}

function DeleteInstance(){
    id="$1"
    # 删除实例
    # https://help.aliyun.com/document_detail/25507.html
    aliyun ecs DeleteInstance --InstanceId $id --Force true
}

function ModifyInstanceAutoReleaseTime() {
    id="$1"
    # time=$(date -u -v +10H +%FT%H:%M:%SZ)
    time=`date -u +%s`
    time=$(((${time}+3600*8)/86400*86400+1800*13))
    time=$(date -r ${time} +%FT%H:%M:%SZ)
    # 修改实例子自动释放的时间
    # https://help.aliyun.com/document_detail/47576.html
    aliyun ecs ModifyInstanceAutoReleaseTime --InstanceId $id --AutoReleaseTime $time
}

main