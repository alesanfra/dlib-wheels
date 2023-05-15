# Dlib binary distribution

[![Build](https://github.com/alesanfra/dlib-wheels/actions/workflows/build.yaml/badge.svg)](https://github.com/alesanfra/dlib-wheels/actions/workflows/build.yaml)
[![PyPI version](https://badge.fury.io/py/dlib-bin.svg)](https://badge.fury.io/py/dlib-bin)


This project creates a pre-compiled distrubution of [dlib](https://github.com/davisking/dlib) ready to be used in your python projects.

With `dlib-bin` you're just one `pip install` away from your next machine learning project!

Currently building x86_64 wheels for windows, macOS and linux ([manylinux2014](https://www.python.org/dev/peps/pep-0571))

## How to install this distribution?

Just open a terminal and type:

```bash
pip install dlib-bin
```

## How to contribute?

In order to trigger a new deploy, update the following variables in `.github/workflows/build.yaml` file:

- `BUILD_COMMIT`  with the new tag/commit pushed on the [dlib](https://github.com/davisking/dlib) repository;

- `DLIB_BIN_VERSION` with the desired `dlib-bin` version on PyPI.
