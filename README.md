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

## How Builds Work

Wheels are built by the [build workflow](.github/workflows/build.yaml) using [cibuildwheel](https://cibuildwheel.pypa.io/).

**When it runs:**

- **Push to `master`** – builds all wheels and publishes them to PyPI
- **Pull request to `master`** – builds all wheels without publishing; a newer push to the same PR cancels the running build
- **Manual run** – from *Actions → Build → Run workflow* (or `gh workflow run build.yaml --ref <branch>`), builds all wheels on any branch without publishing

Changes that only touch Markdown files (such as this README) do not trigger a build.

**One job per platform:**  
Each platform (e.g. `manylinux_x86_64`, `macosx_arm64`, `win_amd64`) gets a single job that builds the wheels for every supported Python version one after the other. New Python versions are picked up automatically through the `cp3*` build selector, limited by `CIBW_PROJECT_REQUIRES_PYTHON`.

**Compiler cache (ccache):**  
On Linux and macOS every C/C++ compilation goes through [ccache](https://ccache.dev/), enabled via the `CMAKE_C_COMPILER_LAUNCHER` and `CMAKE_CXX_COMPILER_LAUNCHER` environment variables. The cache directory is saved with `actions/cache`, so it is reused in two ways:

- **Across Python versions in the same job** – the dlib C++ core does not depend on Python, so it is compiled once and reused for every Python version. The pybind11 bindings include the Python headers and are compiled for each version.
- **Across workflow runs** – the cache key contains the platform and `BUILD_COMMIT`. A run first looks for a cache of the same dlib version, then falls back to the latest cache for the same platform. Rebuilding the same dlib version is therefore almost entirely served from the cache.

ccache identifies each object by hashing the source, all included headers, the compiler flags and the compiler itself, so a stale cache can never produce a wrong build:

- **New Python version** – the dlib core comes from the cache, only the bindings for the new version are compiled.
- **New dlib version** – unchanged files come from the cache, changed ones are recompiled. In the worst case the build is as fast as without a cache.
- **New cibuildwheel version** – a new build image usually ships a different compiler, so the first run recompiles everything.

The cache is capped at 1 GB per platform (`CCACHE_MAXSIZE`) and compressed; ccache evicts the least recently used objects when it is full, and GitHub deletes caches that have not been used for 7 days.

Windows does not use ccache, because dlib's `setup.py` uses the Visual Studio CMake generator, which ignores compiler launchers.

## Important Notes

**Version 20 and Beyond:**  
Starting with version 20.0.1 (March 2026), this distribution builds binary wheels for Python 3.10, 3.11, 3.12, 3.13, 3.14, and 3.15.

**macOS Support:**  
Following Apple's deprecation of Intel-based macOS builds, we now support **Apple Silicon (arm64) only** starting from version 20.