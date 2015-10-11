# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/jenkins/vfs/drive_ccache
export KBUILD_BUILD_USER=Legacy
export KBUILD_BUILD_HOST=LegacyBOT
prebuilts/misc/linux-x86/ccache/ccache -M 490G

#repo sync
#repo sync -j8

# clean
make clean && make clobber

cd /home/jenkins/vfs/user_common/ResurrectionRemix

. build/envsetup.sh
lunch cm_$device-userdebug
make bacon -j8

# upload
cp out/target/product/$device/Resurrection*.zip /home/jenkins/vfs/user_common/builds/ResurrectionRemix/
