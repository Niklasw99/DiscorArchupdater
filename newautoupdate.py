import requests
import shutil
import os

with open('version') as f:
    discorversion = str(f.read().splitlines()[0])
discorversionstr = str(discorversion)
getlink='https://dl.discordapp.net/apps/linux/0.0.' + discorversionstr + '/discord-0.0.' + discorversionstr + ".tar.gz"
x = requests.head(getlink)
print(x.status_code)

statuscode = x.status_code

while statuscode == 200:
    getlink='https://dl.discordapp.net/apps/linux/0.0.' + discorversionstr + '/discord-0.0.' + discorversionstr + ".tar.gz"
    x = requests.head(getlink)
    statuscode = x.status_code
    if statuscode != 200:
        discorversion = discorversion - 1
        discorversionstr = str(discorversion)
        getlink='https://dl.discordapp.net/apps/linux/0.0.' + discorversionstr + '/discord-0.0.' + discorversionstr + ".tar.gz"
        os.system("wget " + getlink)
        os.system("tar -xvf discord-0.0." + discorversionstr + ".tar.gz")
        os.remove("./Discord/discord.desktop")
        os.system("sudo cp -rfv ./Discord/* /opt/discord/")
    else:
        discorversion = int(discorversion) + 1
        discorversionstr = str(discorversion)
