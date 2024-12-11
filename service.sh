#!/usr/bin/env sh
until [ "$(getprop sys.boot_completed)" == "1" ]; do
    sleep 1
done
sleep 3
#thanks openwrt's /etc/init.d/zram
ram_getsize()
{
	local line

	while read line; do case "$line" in MemTotal:*) set $line; echo "$2"; break ;; esac; done </proc/meminfo
}

# zram half as ram, 2048, set to 1024 to be same size breh
echo $(( $(ram_getsize) / 2048))M>/sys/block/zram0/disksize

#we always have this
echo lzo >/sys/block/zram0/comp_algorithm
#faster
echo lz4 >/sys/block/zram0/comp_algorithm
mkswap /dev/block/zram0
swapon  /dev/block/zram0


