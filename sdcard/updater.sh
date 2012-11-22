#!/system/bin/sh

mount=/mnt/sdcard

# needed for old updater.sh that had a typo
if [ -d $mount/sk8sUdater ]
then
    mv $mount/sk8sUdater $mount/sk8sUpdater
else
    mkdir -p $mount/sk8sUpdater
fi

path=$mount/sk8sUpdater

# delete the old configs
rm -rf $path/*.txt

# lets get the latest configs
echo -e "\n"
wget http://sk8erwitskil.selfip.net:81/url-$1.txt -O $path/url-$1.txt
echo -e "\n"
wget http://sk8erwitskil.selfip.net:81/version-$1.txt -O $path/version-$1.txt

url=`cat $path/url-$1.txt`
version=`cat $path/version-$1.txt`

if [ -e $path/$version ]
then
    echo -e "\n"
    echo "You already have the latest version"
else
    wget $url -O $path/$version
    echo "install /emmc/sk8sUpdater/$version" > /cache/recovery/openrecoveryscript
    echo -e "\nYour phone will now reboot into recovery and install the latest version\n"
    reboot recovery
fi
