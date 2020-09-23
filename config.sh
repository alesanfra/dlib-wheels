function pre_build {
    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    cd $REPO_DIR && git checkout $BUILD_COMMIT && cd ..
    sed -i'' -e 's/name='"'"'dlib'"'"'/name='"'"'dlib-bin'"'"'/' $REPO_DIR/setup.py
    sed -i'' -e 's/url='"'"'https:\/\/github\.com\/davisking\/dlib'"'"'/url='"'"'https:\/\/github\.com\/alesanfra\/dlib-wheels'"'"'/' $REPO_DIR/setup.py
}
