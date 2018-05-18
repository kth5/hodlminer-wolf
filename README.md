Hodlminer <img src="https://d25lcipzij17d.cloudfront.net/badge.svg?id=gh&type=6&v=2.4.6&x2=0">

This is a multi-threaded CPU miner for HODL algorithm,
fork of Jeff Garzik's reference cpuminer.

License: GPLv2.  See COPYING for details.

Git tree:   https://github.com/ghobson2013/hodlminer-wolf

Additional contributions were made by:
* Optiminer
* Fuzzbawls
* nicehash
* pooler
* TheTDD

Dependencies:
	libcurl			http://curl.haxx.se/libcurl/
	jansson			http://www.digip.org/jansson/
		(jansson is included in-tree)

Basic *nix build instructions:
```
        sudo apt-get install libcurl-dev
	./autogen.sh	# only needed if building from git repo
	./nomacro.pl	# only needed if building on Mac OS X or with Clang
	./configure CFLAGS="-O3 -march=native" --with-curl
	make
```
	Note: see install instructions for static building in ./install-static-instructions.txt

### Windows build steps:
The only tested way is using [Cygwin x86_64](https://cygwin.com/setup-x86_64.exe).

Please install the following packages:
 - mingw64-x86_64-gcc-g++
 - mingw64-x86_64-curl
 - mingw64-x86_64-openssl
 - make
 - autoconf
 - automake

Run the following commands:
 - ./mingw64-release.sh

```
Architecture-specific notes:
	ARM:	No runtime CPU detection. The miner can take advantage
		of some instructions specific to ARMv5E and later processors,
		but the decision whether to use them is made at compile time,
		based on compiler-defined macros.
		To use NEON instructions, add "-mfpu=neon" to CFLAGS.
	PowerPC: No runtime CPU detection.
		To use AltiVec instructions, add "-maltivec" to CFLAGS.
	x86:	The miner checks for SSE2 instructions support at runtime,
		and uses them if they are available.
	x86-64:	The miner can take advantage of AVX, AVX2 and XOP instructions,
		but only if both the CPU and the operating system support them.
		    * Linux supports AVX starting from kernel version 2.6.30.
		    * FreeBSD supports AVX starting with 9.1-RELEASE.
		    * Mac OS X added AVX support in the 10.6.8 update.
		    * Windows supports AVX starting from Windows 7 SP1 and
		      Windows Server 2008 R2 SP1.
		The configure script outputs a warning if the assembler
		doesn't support some instruction sets. In that case, the miner
		can still be built, but unavailable optimizations are left off.
		The miner uses the VIA Padlock Hash Engine where available.
```

Usage instructions:  Run "hodlminer --help" to see options.


Connecting through a proxy:  Use the --proxy option.
To use a SOCKS proxy, add a socks4:// or socks5:// prefix to the proxy host.
Protocols socks4a and socks5h, allowing remote name resolving, are also
available since libcurl 7.18.0.
If no protocol is specified, the proxy is assumed to be a HTTP proxy.
When the --proxy option is not used, the program honors the http_proxy
and all_proxy environment variables.
