# Building Arculator on Windows with MSYS2

This guide covers building Arculator on Windows using the MSYS2 environment with either the MinGW64 or UCRT64 toolchain.

## Prerequisites

### Install MSYS2

1. Download and install MSYS2 from [https://www.msys2.org/](https://www.msys2.org/)
2. Follow the installation instructions on the website
3. After installation, open the appropriate MSYS2 terminal for your chosen toolchain:
   - **MSYS2 MINGW64** - for MinGW64 builds
   - **MSYS2 UCRT64** - for UCRT64 builds (recommended for modern Windows)

### Install Required Packages

Open your chosen MSYS2 terminal and install the required packages:

**For MINGW64:**
```bash
pacman -S --needed \
    mingw-w64-x86_64-gcc \
    mingw-w64-x86_64-cmake \
    mingw-w64-x86_64-ninja \
    mingw-w64-x86_64-pkg-config \
    mingw-w64-x86_64-libpcap \
    git
```

**For UCRT64:**
```bash
pacman -S --needed \
    mingw-w64-ucrt-x86_64-gcc \
    mingw-w64-ucrt-x86_64-cmake \
    mingw-w64-ucrt-x86_64-ninja \
    mingw-w64-ucrt-x86_64-pkg-config \
    mingw-w64-ucrt-x86_64-libpcap \
    git
```

## Building

### Clone the Repository

```bash
git clone https://github.com/your-repo/arculator.git
cd arculator
```

### Configure with CMake

Use the appropriate preset for your toolchain:

**For MINGW64:**
```bash
cmake --preset msys2-mingw64
```

**For UCRT64:**
```bash
cmake --preset msys2-ucrt64
```

This will configure the build in the `build-mingw64` or `build-ucrt64` directory respectively.

### Build

**For MINGW64:**
```bash
cmake --build build-mingw64
```

**For UCRT64:**
```bash
cmake --build build-ucrt64
```

### Install

The install step is **required** to set up Arculator correctly. It copies the executable along with all required ROMs, podules, and configuration files to the install directory.

**For MINGW64:**
```bash
cmake --install build-mingw64
```

**For UCRT64:**
```bash
cmake --install build-ucrt64
```

By default, this installs to the `install/` directory in the project root.

### One-Line Build and Install

You can combine the build and install steps:

**For MINGW64:**
```bash
cmake --build build-mingw64 --target install
```

**For UCRT64:**
```bash
cmake --build build-ucrt64 --target install
```

## Running Arculator

After installation, navigate to the `install/` directory and run:

```bash
./arculator.exe
```

Or from Windows Explorer, double-click `arculator.exe` in the install folder.

## Debug Builds

For development or debugging, use the debug preset:

```bash
cmake --preset debug
cmake --build build-debug --target install
```

This enables debug symbols and additional logging output.

## Troubleshooting

### CMake not found
Ensure you're using the correct MSYS2 terminal (MINGW64 or UCRT64, not the MSYS terminal).

### Missing DLLs when running
The install step should copy required runtime DLLs. If you still get missing DLL errors, ensure you've run the install step and are running the executable from the install directory.

### Build fails with compiler errors
Make sure you have the latest packages installed:
```bash
pacman -Syu
```

Then reinstall the build dependencies.
