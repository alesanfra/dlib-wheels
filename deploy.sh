#!/bin/bash

echo "Uploading to pypi"
ls -l wheelhouse
python3 -m pip install twine
python3 -m twine upload --skip-existing wheelhouse/*.whl
