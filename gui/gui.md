

## setup wsl
install wsl2 on windows 11
%userprofile%/.wslconfig

```ini
[wsl2]
networkingMode=mirrored
firewall=false
```

```shell
wsl --list
wsl --terminate Ubuntu-22.04
wsl -d Ubuntu-22.04

# install openssh-server and start

# copy-ssh-id


```


## run gui in wsl with built in x-server and pulse-audio server

https://github.com/microsoft/wslg/blob/main/samples/container/Containers.md

https://stackoverflow.com/questions/73092750/how-to-show-gui-apps-from-docker-desktop-container-on-windows-11


https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps
https://github.com/microsoft/wslg/wiki/Diagnosing-%22cannot-open-display%22-type-issues-with-WSLg


built in xserver
https://www.youtube.com/watch?v=UEre6Bd75dw
