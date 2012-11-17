#!/system/bin/sh

mkdir -p /mnt/sdcard/sk8sUpdater
path=/mnt/sdcard/sk8sUpdater

rm -rf $path/*.txt

wget http://sk8erwitskil.selfip.net:81/url-$1.txt -O $path/url-$1.txt
wget http://sk8erwitskil.selfip.net:81/version-$1.txt -O $path/version-$1.txt

url=`cat $path/url-$1.txt`
version=`cat $path/version-$1.txt`

if [ -e $path/$version ]
then
echo "You already have the latest version"
else
wget $url -O $path/$version
echo "install /emmc/sk8sUpdater/$version" > /cache/recovery/openrecoveryscript
echo -e "Your phone will now reboot into recovery\n"
echo "Select run openrecoveryscript in recovery"
reboot recovery
fi
