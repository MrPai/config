# https://blog.csdn.net/wumuzibabi/article/details/125966444
# https://juejin.cn/post/7021150715414315039

# 显示本地时间（cst）
date
date -u +%FT%XZ
# 显示utc时间2022-10-26T14:04:19Z
date -u +%FT%H:%M:%SZ

# 时间加减运算 mac：-v -(+) 1d
# 时间加减运算 linux：-d "1（-）day ago"
# 当前时间转换为utc，再+10小时并输出指定格式
date -u -v +10H +%FT%H:%M:%SZ

# 加1天
date -v +1d +%F

# 1666880690
date -j -f %Y-%m-%d $(date -v +1d +%F) +%s

# Linux date 获取指定时间
#https://wxnacy.com/2019/06/18/date-want-time/

# https://blog.51cto.com/u_14724308/4740207
# 当天零点时间
 # 86400为一天的秒数
time=`date +%s`
# 今日零点时间
ZERO_TIME=$(((${time}+3600*8)/86400*86400-3600*8))
# 昨日零点时间(秒)
Y_ZERO_TIME=${ZERO_TIME} - 86400
# 昨日零点时间(毫秒)
ddd=$(((${time}+3600*8)/86400*86400-3600*32))'000'

# 今天9点
d1=$(((${time}+3600*8)/86400*86400+3600))'000'

# 今天16点
d1=$(((${time}+3600*8)/86400*86400+3600*8))'000'

# 今天21点30
d1=$(((${time}+3600*8)/86400*86400+1800*27))'000'

# 今天22点30, utc0时间
d1=$(((${time}+3600*8)/86400*86400+1800*29))'000'
