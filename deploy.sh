#!/bin/bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    pip3 install twine
    pip3 install --upgrade six
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
    pip3 install twine
    pip3 install --upgrade pyOpenSSL
fi

echo "Uploading to pypi"
ls -l ${TRAVIS_BUILD_DIR}/wheelhouse
twine upload --skip-existing ${TRAVIS_BUILD_DIR}/wheelhouse/dlib_bin*