# minimum-os
A minimum OS written by Rust

## Requirement
```
$ rustc --version
rustc 1.27.0-nightly (ad610bed8 2018-04-11)

$ rustup show
Default host: x86_64-unknown-linux-gnu

installed toolchains
--------------------

stable-x86_64-unknown-linux-gnu
nightly-x86_64-unknown-linux-gnu (default)

active toolchain
----------------

nightly-x86_64-unknown-linux-gnu (default)
rustc 1.27.0-nightly (ad610bed8 2018-04-11)

$ nasm -v
NASM version 2.11.08

$ mtools --version # To use mformat and mcopy commands to create disk image
mtools (GNU mtools) 4.0.18
configured with the following options: enable-xdf disable-vold disable-new-vold disable-debug enable-raw-term 
```


## Commands
Check an img file
```
$ ghex minimum.img
```

The command to assemble
```
$ make img
```

The command to work an image file
```
$ make run
```
