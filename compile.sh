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

echo  "$red*****************************************************"
echo  "*****************************************************"
echo  "$purple Script modified by MhDzuMAiR || made by IzaKQuLL "
echo  "$yellow ________________________________________________ "
echo  "$red*****************************************************"
echo  "*****************************************************$nocol"

#make kernel compiling dir...
{
if [ -f out ];
then rm -rf out
fi
}
mkdir -p out


#toolchain , custom build_user , custom build_host , arch
export ARCH=arm
export ARCH_MTK_PLATFORM=mt6735
export CROSS_COMPILE=/home/dedsec/Desktop/MhDzMR-kernel/gcc-linaro-7.5.0-2019.12-x86_64_arm-eabi/bin/arm-eabi-
export KBUILD_BUILD_USER="CheRRy"
export KBUILD_BUILD_HOST="JiLeBi"
#make build clean and mrproper
make clean mrproper

compile_kernel ()
{                                                                                                     
echo
echo
echo "$blue***********************************************"
echo "          Compiling MhDzMR™.anDroid Kernel...          "
echo "***********************************************$nocol"
echo ""

#woods defconfig
make -C $PWD O=out ARCH=arm woods_defconfig
#
make -j8 -C $PWD O=out ARCH=arm
echo "$yellow Copying to out/Anykernel3 $nocol"
cp out/arch/arm/boot/zImage-dtb outdir/AnyKernel3/

if ! [ -f $ZIMAGE ];
then
echo "$red Kernel Compilation failed! Fix the errors! $nocol"
exit 1
fi
}

zip_zak ()
{
echo ""
echo ""
echo "$purple
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| | ____    ____ | || |  ____  ____  | || |  ________    | || |   ________   | || | ____    ____ | || |  _______     | |
| ||_   \  /   _|| || | |_   ||   _| | || | |_   ___ `.  | || |  |  __   _|  | || ||_   \  /   _|| || | |_   __ \    | |
| |  |   \/   |  | || |   | |__| |   | || |   | |   `. \ | || |  |_/  / /    | || |  |   \/   |  | || |   | |__) |   | |
| |  | |\  /| |  | || |   |  __  |   | || |   | |    | | | || |     .'.' _   | || |  | |\  /| |  | || |   |  __ /    | |
| | _| |_\/_| |_ | || |  _| |  | |_  | || |  _| |___.' / | || |   _/ /__/ |  | || | _| |_\/_| |_ | || |  _| |  \ \_  | |
| ||_____||_____|| || | |____||____| | || | |________.'  | || |  |________|  | || ||_____||_____|| || | |____| |___| | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 


"
echo  "$cyan***********************************************"
echo "          Packing MhDzMR™ anDroid Kernel...          "
echo  "***********************************************$nocol"
echo ""
echo  "$yellow Putting MhDzMR™.anDroid Kernel in Recovery Flashable Zip $nocol"

#using AnyKernel3 templete
cd outdir/AnyKernel3
    make
    sleep 0.6;
    echo ""
    echo ""
    echo "" "Done Making Recovery Flashable Zip"
    echo ""
    echo ""
    echo "" "Locate MhDzMR™.anDroid Kernel in the following path : "
    echo "" "outdir/Anykernel3"
    echo ""
    echo  "$green 
    
███╗   ███╗██╗  ██╗██████╗ ███████╗███╗   ███╗██████╗     
████╗ ████║██║  ██║██╔══██╗╚══███╔╝████╗ ████║██╔══██╗    
██╔████╔██║███████║██║  ██║  ███╔╝ ██╔████╔██║██████╔╝    
██║╚██╔╝██║██╔══██║██║  ██║ ███╔╝  ██║╚██╔╝██║██╔══██╗    
██║ ╚═╝ ██║██║  ██║██████╔╝███████╗██║ ╚═╝ ██║██║  ██║    
╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
    "                         
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
    sleep 5.0;
    echo ""
    echo ""
    echo ""

}

compile_kernel
zip_zak
