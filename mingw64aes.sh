autoreconf -fiv 
make clean

# icon
windres res/icon.rc icon.o

export DEPS_PATH=/usr/x86_64-w64-mingw32/sys-root/mingw

export CFLAGS="-Ofast -msse4.2 -maes"
export CXXFLAGS="${CFLAGS} -std=gnu++11 -flto -fpermissive"
export LDFLAGS="-lwsock32"
./configure --target=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --build=x86_64-w64-mingw32 --with-curl=${DEPS_PATH} --with-crypto=${DEPS_PATH}

make -j1

strip -p --strip-debug --strip-unneeded hodlminer.exe

mkdir -p bin
mv hodlminer.exe bin/hodlminer_AES.exe
