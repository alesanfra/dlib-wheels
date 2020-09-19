#!/bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    pip install twine
    pip install --upgrade six
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    pip install twine
    pip install --upgrade pyOpenSSL
fi

echo "Uploading to pypi"
ls -l ${TRAVIS_BUILD_DIR}/wheelhouse
twine upload --skip-existing ${TRAVIS_BUILD_DIR}/wheelhouse/dlib_bin*