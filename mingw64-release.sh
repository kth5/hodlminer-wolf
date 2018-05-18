#!/bin/bash
rm -rf bin
mkdir -p bin

./mingw64aes.sh
./mingw64avx+aes.sh
./mingw64avx2+aes.sh

# attempt to find our sys-root
BIN_PATH=`dirname $(find /usr/x86_64-w64-mingw32/ -name zlib1.dll)`

# find out dependencies / some may not exist but that's ok. 
BIN_DLLS=`strings bin/hodlminer_AES.exe  | grep '\.dll'`

for dll in ${BIN_DLLS}; do
	cp ${BIN_PATH}/${dll} bin/
done

# same all over again for the dlls
BIN_DLLS=`strings bin/*.dll  | grep '\.dll'`

for dll in ${BIN_DLLS}; do
        cp ${BIN_PATH}/${dll} bin/
done
