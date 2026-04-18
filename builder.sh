#!/bin/bash
echo -e "\e[38;2;0;0;255mBuild Started\e[0m"
nasm -f bin asm/bootloader.asm -o stage1.bin
nasm -f bin asm/bt2.asm -o stage2.bin
cat stage1.bin stage2.bin > testboot.bin
rm stage1.bin
rm stage2.bin
echo -e "\e[32mLoading...\e[0m"
qemu-system-x86_64 -drive format=raw,file=testboot.bin -nographic