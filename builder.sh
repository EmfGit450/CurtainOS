#!/bin/bash
echo -e "\e[38;2;0;0;255mBuild Started\e[0m"
nasm -f bin test.asm -o testboot.bin && echo -e "\e[32mLoading...\e[0m" && qemu-system-x86_64 -drive format=raw,file=testboot.bin -nographic