# Define custom utilities
# Test for macOS with [ -n "$IS_OSX" ]

function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    sed -i'' -e 's/name='"'"'dlib'"'"'/name='"'"'dlib-bin'"'"'/' dlib/setup.py
    sed -i'' -e 's/url='"'"'https:\/\/github\.com\/davisking\/dlib'"'"'/url='"'"'https:\/\/github\.com\/alesanfra\/dlib-wheels'"'"'/' dlib/setup.py
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import dlib'
}
