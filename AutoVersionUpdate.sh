#!/bin/bash
version=$( cat version )

getlink="https://dl.discordapp.net/apps/linux/0.0.${version}/discord-0.0.${version}.tar.gz"
status_code=$(curl --write-out %{http_code} --silent --output /dev/null $getlink)

while  [[ "$status_code" -eq 200 ]]
do
getlink="https://dl.discordapp.net/apps/linux/0.0.${version}/discord-0.0.${version}.tar.gz"
status_code=$(curl --write-out %{http_code} --silent --output /dev/null $getlink)
if [[ "$status_code" -ne 200 ]] ; then
    let "version=version - 1"
    echo $version is advaliable ; echo $version >version
    getlink="https://dl.discordapp.net/apps/linux/0.0.${version}/discord-0.0.${version}.tar.gz"
    wget $getlink
    tar -xvf "discord-0.0.$version.tar.gz"
    rm ./Discord/discord.desktop
    sudo cp -rfv ./Discord/* /opt/discord/
    rm -rf discord*.tar.gz*
    rm -rf Discord
else
    let "version=version + 1"
    echo "testing {$version}"
fi
done
