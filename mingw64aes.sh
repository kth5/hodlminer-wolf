autoreconf -fiv 
make clean

# icon
windres res/icon.rc icon.o

export TARGET=x86_64-w64-mingw32
export CFLAGS="${CFLAGS} -msse4.2 -maes"
export CXXFLAGS="${CFLAGS} -std=gnu++11 -flto -fpermissive"
export LDFLAGS="-lwsock32"
./configure --target=${TARGET} --host=${TARGET} --with-curl --with-crypto

make -j1

strip -p --strip-debug --strip-unneeded hodlminer.exe

mkdir -p bin
mv hodlminer.exe bin/hodlminer_AES.exe
