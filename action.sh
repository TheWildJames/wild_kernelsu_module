#!/usr/bin/env sh

MODDIR="${0%/*}"
desription="Module for Wild Kernel"
kernel_version=$(cat /proc/version)

if echo "$kernel_version" | grep -q "ild"; then
    echo "*"
    echo "*"
    echo "*"
	echo "[+] You are using Wild Kernel"
    echo "*"
    echo "*"
    echo "*"
    echo "*"
    echo "[+] $kernel_version"
    echo "*"
    echo "*"
    echo "*"
    desription="description=Wild Kernel | status: active ✅"
else
    echo "You are not using Wild Kernel"
    desription="description=Wild Kernel | status: disabled ❌"
fi

sed -i "s/^description=.*/$desription/g" $MODDIR/module.prop

sleep 5