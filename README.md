# TD3 Tps

This repository contains all practical work done during the attendance to the "Digital techniques 3" course in the university UTN FRBA.

## Usage

Inside the Makefile, you may change the variables' values under the section *User modifiable variables* to point to the current exercise directory you wish to run. After that, execute the Makefile as follows:

```bash
make        # Show help message
make debug  # Compile, run and debug program all at once
```

## Installation

You need to have:

* The cross-compiler [gcc-linaro-x86_64_arm-linux-gnueabihf](https://releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabihf/) for compilation, and add the `bin` directory to your `PATH`.

* The processor simulator [qemu-system-arm](https://wiki.qemu.org/Documentation/Platforms/ARM).

* The debugger *gdb-multiarch*.
