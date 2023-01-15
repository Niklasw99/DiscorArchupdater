# DiscordArchUpdater
just a simple updater for Discord installed via the Official Arch Repo, 
it will download the tar.gz fomr Discord's website,
extract it, 
remove a .desktop file that allready exists.
replace the old files for discord. in the opt dir.
That's it.


Manual version update, you can edit update.sh to select a specific version

```
git clone https://github.com/Niklasw99/DiscorArchupdater.git ; sh ./DiscorArchupdater/update.sh
```


Automatic Version selection and update
```
git clone https://github.com/Niklasw99/DiscorArchupdater.git ; cd DiscorArchupdater ; sh AutoVersionUpdate.sh
