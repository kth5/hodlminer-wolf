#!/bin/bash
./mingw64aes.sh
./mingw64avx+aes.sh
./mingw64avx2+aes.sh

mkdir -p bin
for dll in libcurl-4.dll libnghttp2-14.dll libssh2-1.dll libwinpthread-1.dll zlib1.dll; do
  cp -v /usr/x86_64-w64-mingw32/sys-root/mingw/bin/${dll} bin/
done
