# Dlib binary distribution

[![Build Status](https://travis-ci.com/alesanfra/dlib-wheels.svg?branch=master)](https://travis-ci.com/alesanfra/dlib-wheels)
[![PyPI version](https://badge.fury.io/py/dlib-bin.svg)](https://badge.fury.io/py/dlib-bin)


This project creates a pre-compiled distrubution of [dlib](https://github.com/davisking/dlib) ready to be used in your projects.

With `dlib-bin` you're just one `pip install` away from your next machine learning project!

Currently building for wheels for macOS and linux ([manylinux1](https://www.python.org/dev/peps/pep-0513) x86_64 and i686). Windows builds are coming soon!

## How to install this distribution?

Just open a terminal and type:

```bash
pip install dlib-bin
```

## How to contribute?

In order to trigger a new deploy, update the `BUILD_COMMIT` envirnonment variable in `.travis.yml` file with the desired git tag pushed on the [dlib](https://github.com/davisking/dlib) repository. 
