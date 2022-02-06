# local-aur

local-aur is a script, which builds aur packages, so that you can install them with pacman.

## Usage

### Build a new package

To build a new packages just execute:

```
local-aur build [pkgnames]
```

To sync the pacman database you have to run:

```
pacman -Sy
```

Now you can install the packages:

```
pacman -S [pkgnames]
```

You can also sync the database and install the packages in one command:

```
pacman -Sy [pkgnames]
```

### Update a package

To update packages just execute:

```
local-aur build [pkgnames]
```

With the `-u` or the `--update-all` flag you can update all packages:

```
local-aur build -u
```

There is also a systemd service and a systemd timer for updating all packages.

To check for updates every 10 minutes just execute:

```
systemctl enable local-aur.timer
```

If a new update has been build, you can see it with the `checkupdates` command of [`pacman-contrib`](https://archlinux.org/packages/community/x86_64/pacman-contrib/) and install it with:

```
pacman -Sy [pkgnames]
```

If you want to install all updates (of local-aur and every other repo), just execute:

```
pacman -Syu
```

### Remove a package

To remove packages just execute:

```
local-aur remove [pkgnames]
```

This will remove the packages from local-aur, so the package will neither be updated nor be installable with pacman.

To uninstall it from pacman, just execute:

```
pacman -Rs [pkgnames]
```

## Installation

With executing

```
wget -qO- https://raw.githubusercontent.com/rpkak/local-aur/master/install.sh | sh
```

or 

```
curl -s https://raw.githubusercontent.com/rpkak/local-aur/master/install.sh | sh
```

you can install local-aur and add itself to the local-aur repo.

With this a new update of `local-aur` will be build by `local-aur build -u` or the `local-aur` systemd service.
