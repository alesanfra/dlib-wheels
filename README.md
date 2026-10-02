# Dlib Binary Distribution

[![Build](https://github.com/alesanfra/dlib-wheels/actions/workflows/build.yaml/badge.svg)](https://github.com/alesanfra/dlib-wheels/actions/workflows/build.yaml)
[![PyPI version](https://badge.fury.io/py/dlib-bin.svg)](https://badge.fury.io/py/dlib-bin)


This project provides pre-compiled binary wheels of [dlib](https://github.com/davisking/dlib), making it easy to integrate into your Python projects without the hassle of building from source.

With `dlib-bin`, you're just one `pip install` command away from starting your next machine learning project!

## Supported Platforms

We currently build wheels for the following platforms:

- **Windows** (AMD64)
- **macOS** (Apple Silicon / arm64)
- **Linux GLIBC-based** distributions like Ubuntu, Debian, and RHEL (x86_64 and aarch64, [manylinux_2_28](https://peps.python.org/pep-0600/))
- **Linux MUSL-based** distributions like Alpine (x86_64 and aarch64, [musllinux_1_2](https://peps.python.org/pep-0656/))

## Installation

Installing `dlib-bin` is straightforward. Simply run:

```bash
pip install dlib-bin
```

That's it! No compilers, no build tools—just a ready-to-use dlib installation.

## Contributing

We welcome contributions! If you'd like to trigger a new release, please update the following variables in the `.github/workflows/build.yaml` file:

- **`BUILD_COMMIT`** – Set this to the new tag or commit from the [dlib repository](https://github.com/davisking/dlib) that you want to build
- **`DLIB_BIN_VERSION`** – Set this to the desired version number for the `dlib-bin` package on PyPI

Once updated, simply commit and push your changes to trigger the build workflow.

## Important Notes

**Version 20 and Beyond:**  
Starting with version 20.0.1 (March 2026), this distribution builds binary wheels for Python 3.10, 3.11, 3.12, 3.13, 3.14, and 3.15.

**macOS Support:**  
Following Apple's deprecation of Intel-based macOS builds, we now support **Apple Silicon (arm64) only** starting from version 20.