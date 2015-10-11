#!/bin/bash
# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/jenkins/vfs/drive_ccache
export candy5_BUILDTYPE=OFFICIAL
export KBUILD_BUILD_USER=Legacy
export KBUILD_BUILD_HOST=LegacyBOT


prebuilts/misc/linux-x86/ccache/ccache -M 490G

#repo sync
repo sync -j4

# clean
make clean && make clobber

cd /home/jenkins/vfs/user_common/Candy5

. build/envsetup.sh
lunch candy5_$device-userdebug
make bacon -j8

# upload
cp out/target/product/$device/candy5-re*.zip /home/jenkins/vfs/user_common/builds/Candy5
cp out/target/product/$device/ota.xml /home/jenkins/vfs/user_common/builds/Candy5/ota/$device.xml
