# Archlinux
## Usefull commands
- For pacman:
    - pacman -R package         // remove only the package
    - pacman -Rcns package      // remove package and dependencies
    - pacman -Qdtq              // find orphan packages
    - pacman -R ($pacman -Qdtq) // remove orphan packages 
    - pacman -Syy               // refresh repositores
    - pacman -Su                // upgrade
    - pacman <...> --noconfirm  // dont ask for confirmation
    - pacman -Si <package>      // view information of an installed package
    - pacman -Qi <package>      // view information of package from repository 

- Pacman cache: (/var/cache/pacman/pkg/) path for cached packages
    - du -sh /var/cache/pacman/pkg  // view size of cached packages
    - paccache -r       // keeps 3 most recent version of packages
    - paccache -rk1     // the "k 1" indicates the count of packge versions to keep
    - pacman -Sc        // remove all old versions of cached packages
    - pacman -Scc       // remove all cached packages

## Repositories setup
Edit file /etc/pacman.d/mirrorlist
comment all the server mirrors found, and just keep uncommmented a line with
this content:
Server=https://archive.archlinux.org/repos/2023/08/05/$repo/os/$arch  
Replace the date with the actual date you want the repositoriy points
this way you will have access to all packages at this datepoint:

sudo pacman -Syyuu  // to force the downgrade of packages


### Downgrading packages manually
Is also possible to downgrade just one packages.
If the old version remains in the pacman cache:  
pacman -U file:///var/cache/pacman/pkg/package-old_version.pkg.tar.type

otherwise the package needs to be retrived from online repository:
https://archive.archlinux.org/packages/     // search the package here

find the package version and then force the upgrade:
pacman -U https://archive.archlinux.org/packages/path/packagename.pkg.tar.zst


#### Usefull links from arch wiki:
https://wiki.archlinux.org/title/Arch_Linux_Archive#/packages
https://wiki.archlinux.org/title/Downgrading_packages#Automation
https://wiki.archlinux.org/title/Arch_Linux_Archive#How_to_downgrade_one_package
https://wiki.archlinux.org/title/Official_repositories




