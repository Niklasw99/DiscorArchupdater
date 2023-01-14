wget "https://dl.discordapp.net/apps/linux/0.0.24/discord-0.0.24.tar.gz"
tar -xvf "discord-0.0.24.tar.gz"
rm ./Discord/discord.desktop
sudo cp -rfv ./Discord/* /opt/discord/
rm -rf discord*.tar.gz*
rm -rf Discord
