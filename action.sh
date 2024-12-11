#!/usr/bin/env sh

MODDIR="${0%/*}"
desription="Module for Wild Kernel"
kernel_version=$(cat /proc/version)

if echo "$kernel_version" | grep -q "wild"; then
	desription="description=Wild Kernel | status: active ✅"
else
    desription="description=Wild Kernel | status: disabled ❌"
fi

sed -i "s/^description=.*/$desription/g" $MODDIR/module.prop

sleep 5