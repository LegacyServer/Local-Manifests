#!/bin/bash

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/jenkins/vfs/drive_ccache
export KBUILD_BUILD_USER=LegacyServer
export KBUILD_BUILD_HOST=TheLegacyBOT


prebuilts/misc/linux-x86/ccache/ccache -M 490G

#repo 
#repo forall -vc "git reset --hard" && repo sync -j8 --force-sync
 
# clean
#make clean && make clobber
 
cd /home/jenkins/vfs/user_common/TeslaROM
 
. build/envsetup.sh
lunch tesla_$device-userdebug
make tesla -j8
