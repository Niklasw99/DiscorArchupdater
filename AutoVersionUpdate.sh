#!/bin/bash
discorversion=$( cat version )

getlink="https://dl.discordapp.net/apps/linux/0.0.${discorversion}/discord-0.0.${discorversion}.tar.gz"
status_code=$(curl -w "%{http_code}\n" -s $getlink)

while  [[ "$status_code" -eq 200 ]]
do
getlink="https://dl.discordapp.net/apps/linux/0.0.${discorversion}/discord-0.0.${discorversion}.tar.gz"
status_code=$(curl -w "%{http_code}\n" -s $getlink)
if [[ "$status_code" -ne 200 ]] ; then
    let "discorversion=discorversion - 1"
    echo $discorversion is advaliable ; echo $discorversion >discorversion
    getlink="https://dl.discordapp.net/apps/linux/0.0.${discorversion}/discord-0.0.${discorversion}.tar.gz"
    wget $getlink
    tar -xvf "discord-0.0.$version.tar.gz"
    rm ./Discord/discord.desktop
    sudo cp -rfv ./Discord/* /opt/discord/
    rm -rf discord*.tar.gz*
    rm -rf Discord
else
    let "discorversion=discorversion + 1"
    echo "testing {$discorversion}"
fi
done
