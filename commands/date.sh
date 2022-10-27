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