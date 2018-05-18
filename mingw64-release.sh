#!/bin/bash
./mingw64aes.sh
./mingw64avx+aes.sh
./mingw64avx2+aes.sh

BIN_PATH=`dirname $(find /usr/x86_64-w64-mingw32/ -name zlib1.dll)`
BIN_DLLS=`strings bin/hodlminer_AES.exe  | grep '\.dll' | grep -Ev "KERNEL32.dll|USER32.dll|WS2_32.dll"`

mkdir -p bin
for dll in ${BIN_DLLS}; do
	cp -v ${BIN_PATH}/${dll} bin/
done
