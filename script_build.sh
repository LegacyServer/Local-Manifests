#!/bin/bash

# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/jenkins/vfs/drive_ccache
export KBUILD_BUILD_USER=LegacyServer
export KBUILD_BUILD_HOST=TheLegacyBOT
OUT_DIR=/home/jenkins/vfs/user_common/ValidusROM/out2


prebuilts/misc/linux-x86/ccache/ccache -M 490G

#repo
#repo forall -vc "git reset --hard"
repo sync -j8 --force-sync

# clean
make clean && make clobber
#make installclean
cd /home/jenkins/vfs/user_common/ValidusROM

. build/envsetup.sh
lunch validus_$device-userdebug
make validus -j8
