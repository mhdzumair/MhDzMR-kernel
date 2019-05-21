#!/bin/sh
# Custom build script


KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/out/arch/arm/boot/zImage-dtb
BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
green='\033[0;92m'
red='\033[0;31m'
purple='\033[0;95m'
white='\033[0;97m'
nocol='\033[0m'

#make kernel compiling dir...
{
if [ -f out ];
then rm -rf out
fi
}
mkdir -p out


#exports ::
#toolchain , custom build_user , custom build_host , arch
export ARCH=arm
export ARCH_MTK_PLATFORM=mt6735
#export CROSS_COMPILE=~/arm-eabi-4.9/bin/arm-eabi-
export CROSS_COMPILE=$(pwd)/gcc-linaro-6.3/bin/arm-eabi-
export KBUILD_BUILD_USER="MhDzUmAiR"
export KBUILD_BUILD_HOST="JiLeBi"

#make build clean and mrproper
make clean mrproper

compile_kernel ()
{
 echo
 echo
 
echo "$blue          ▪       ▐ ▄      ▄▄· 
▪         ██     •█▌▐█    ▐█ ▌▪ "
echo "$yellow ▄█▀▄     ▐█·    ▐█▐▐▌    ██ ▄▄ "
echo "$purple▐█▌.▐▌    ▐█▌    ██▐█▌    ▐███▌
 ▀█▄▀▪    ▀▀▀    ▀▀ █▪    ·▀▀▀ "
                                                                                                     
echo
echo
echo "$blue***********************************************"
echo "          Compiling MhDzMR™.anDroid Kernel...          "
echo "***********************************************$nocol"
echo ""
#woods defconfig
make -C $PWD O=out ARCH=arm woods_defconfig
#
make -j4 -C $PWD O=out ARCH=arm
echo "$yellow Copying to out/OincBugxanDroid $nocol"
cp out/arch/arm/boot/zImage-dtb outdir/OincBugxanDroid/Image

if ! [ -f $ZIMAGE ];
then
echo "$red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi
}

zip_zak ()
{
echo
  echo
echo "$cyan█ ▄▄  ██   ▄█▄    █  █▀ ▄█    ▄     ▄▀  
█   █ █ █  █▀ ▀▄  █▄█   ██     █  ▄▀    
█▀▀▀  █▄▄█ █   ▀  █▀▄   ██ ██   █ █ ▀▄  
█     █  █ █▄  ▄▀ █  █  ▐█ █ █  █ █   █ 
 █       █ ▀███▀    █    ▐ █  █ █  ███  
  ▀     █          ▀       █   ██       
       ▀  "
echo  "$cyan***********************************************"
echo "          Packing MhDzMR™ anDroid Kernel...          "
echo  "***********************************************$nocol"
echo ""
echo  "$yellow Putting MhDzMR™.anDroid Kernel in Recovery Flashable Zip $nocol"
#using lazy kernel flasher
cd outdir
cd OincBugxanDroid





    make

    cp OincBugxanDroid-Ngt-woods*zip* out_done
    cd ../../
    sleep 0.6;
    echo ""
    echo ""
    echo "" "Done Making Recovery Flashable Zip"
    echo ""
    echo ""
    echo "" "Locate MhDzMR™.anDroid Kernel in the following path : "
    echo "" "outdir/OincBugxanDroid"
    echo ""
echo  "$green▄   █ ▄▄  █    ████▄ ██   ██▄   ▄█    ▄     ▄▀  
   █  █   █ █    █   █ █ █  █  █  ██     █  ▄▀    
█   █ █▀▀▀  █    █   █ █▄▄█ █   █ ██ ██   █ █ ▀▄  
█   █ █     ███▄ ▀████ █  █ █  █  ▐█ █ █  █ █   █ 
█▄ ▄█  █        ▀         █ ███▀   ▐ █  █ █  ███  
 ▀▀▀    ▀                █           █   ██       
                        ▀ "                         
    echo
    echo  "$blue***********************************************"
    echo "      MhDzMR™.anDroid Kernel "
    echo  "***********************************************$nocol"
    echo ""
    echo " l.o.a.d.i.n.g..."
    sleep 0.4;
    echo "   please wait..."
    sleep 0.1;
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    BUILD_END=$(date +"%s")
    DIFF=$(($BUILD_END - $BUILD_START))
    echo "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$n"
    sleep 15.0;
    echo ""
    echo ""
echo "$green·▄▄▄▄      ▐ ▄▄▄▄ .
██▪ █▪    •█▌▐▀▄.▀·
▐█· ▐█▄█▀▄▐█▐▐▐▀▀▪▄
██. █▐█▌.▐██▐█▐█▄▄▌
▀▀▀▀▀•▀█▄▀▀▀ █▪▀▀▀ "
    echo ""
    echo ""

}


close_me ()
{
clear
 echo
 echo
echo "$green▄▄▄▄·  ▄· ▄▌▄▄▄ .
▐█ ▀█▪▐█▪██▌▀▄.▀·
▐█▀▀█▄▐█▌▐█▪▐▀▀▪▄ "
echo "$yellow██▄▪▐█ ▐█▀·.▐█▄▄▌
·▀▀▀▀   ▀ •  ▀▀▀ "
echo
 echo
 echo
 echo "$blueTalent Is Nothing WIthout Ethics!!!"
 echo
 sleep 2.0;
 clear
exit
}

case $1 in
clean)
#make ARCH=arm -j4 clean mrproper
rm -rf include/linux/autoconf.h
;;
*)
compile_kernel
zip_zak
close_me
;;
esac
