## Windows 10 and newer

Download and install [**Windows Subsystem for Linux**](https://docs.microsoft.com/en-us/windows/wsl/install-win10). Then open the **WSL terminal**.

Update WSL's software before continuing. If you chose Debian, Ubuntu, or another distribution that uses `apt-get`, then enter this command:

```bash
apt-get update && apt-get upgrade
```

WSL has its own file system that's not accessible from Windows, but Windows files *are* accessible from WSL. So you're going to want to install pokepale within Windows. You'll have to change the **current working directory** every time you open WSL.

For example, if you want to store pokepale in **C:\Users\\*\<user>*\Desktop**, enter this command:

```bash
cd /mnt/c/Users/<user>/Desktop
```

(The Windows `C:\` drive is called `/mnt/c/` in WSL. Replace *\<user>* in the example path with your username.)

If this works, then follow [the instructions for **Linux**](#linux) below for whatever distribution you installed for WSL.

Otherwise, continue reading below for [the older Windows instructions](#windows-any-version).


## Windows (any version)

Download [**Cygwin**](http://cygwin.com/install.html): **setup-x86_64.exe** for 64-bit Windows, **setup-x86.exe** for 32-bit.

Run setup and leave the default settings. At the "**Select Packages**" step, choose to install the following, all of which are in the "**Devel**" category:

- `make`
- `git`
- `gcc-core`

Double click on the text that says "**Skip**" next to each package to select the most recent version to install.

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#pre-built) for Windows with Cygwin to install **rgbds 0.8.0**.

Now open the **Cygwin terminal** and enter the following commands.

Cygwin has its own file system that's within Windows, at **C:\cygwin64\home\\*\<user>***. If you don't want to store pokepale there, you'll have to change the **current working directory** every time you open Cygwin.

For example, if you want to store pokepale in **C:\Users\\*\<user>*\Desktop**:

```bash
cd /cygdrive/c/Users/<user>/Desktop
```

(The Windows `C:\` drive is called `/cygdrive/c/` in Cygwin. Replace *\<user>* in the example path with your username.)

Now you're ready to [build **pokepale**](#build-pokepale).


## macOS

Install [**Homebrew**](https://brew.sh/). Follow the official instructions.

Open **Terminal** and prepare to enter commands.

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#pre-built) for macOS to install **rgbds 0.8.0**.

Now you're ready to [build **pokepale**](#build-pokepale).


## Linux

Open **Terminal** and enter the following commands, depending on which distro you're using.

### Debian or Ubuntu

To install the software required for **pokepale**:

```bash
sudo apt-get install make gcc git
```

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.8.0** from source.

### OpenSUSE

To install the software required for **pokepale**:

```bash
sudo zypper install make gcc git
```

Then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.8.0** from source.

### Arch Linux

To install the software required for **pokepale**:

```bash
sudo pacman -S make gcc git rgbds
```

If you want to compile and install **rgbds** yourself instead, then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.8.0** from source.

### Termux

To install the software required for **pokepale**:

```bash
pkg install make clang git sed
```

To install **rgbds**:

```bash
pkg install rgbds
```

If you want to compile and install **rgbds** yourself instead, then follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.8.0** from source.

### Other distros

If your distro is not listed here, try to find the required software in its repositories:

- `make`
- `gcc` (or `clang`)
- `git`
- `rgbds`

If `rgbds` is not available, you'll need to follow the [**rgbds** instructions](https://rgbds.gbdev.io/install#building-from-source) to build **rgbds 0.8.0** from source.

Now you're ready to [build **pokepale**](#build-pokepale).


## Build pokepale

To download the **pokepale** source files:

```bash
git clone https://github.com/pret/pokepale
cd pokepale
```

To build **pokepale.gbc**:

```bash
make
```