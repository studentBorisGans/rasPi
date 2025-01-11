# Installation + Set Up

## First Steps

After booting, log in w username and password I created at setup.

### Wifi Setup

Ensure WiFi radio is on:
``` linux
$ nmcli r wifi on
```
And list availabile networks:
``` linux
$ nmcli d wifi list
```

First, stop NetWorkManager to ensure it won't mess up manual config.
``` bash
sudo systemctl stop NetworkManager
sudo systemctl status NetworkManager
```
Somethings to keep in mind about NetworkManager:
1. It can cause inconsistent behavior when connecting to homenetwork, so I might be better to disable it rather than just stopping it for the time being.
2. Instead of disabling, I can also tell it to ignore this specific interface in the unmanaged-devices setting in NetworkManager configuration
3. I may have to manually sign into wifi each time I reboot, in that case I should write a script to do all this.

Open wpa_spplicant config file:
``` bash
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```
Add this:
``` bash
network={
    ssid="YOUR_SSID"
    key_mgmt=NONE
}
```

Restart networking service
``` bash
sudo wpa_cli -i wlan0 reconfigure
sudo dhclient wlan0
```
Ensure wlan0 is your wireless interface by running
``` bash
iwconfig
```

Install a text-based web browser:
``` bash
sudo apt update
sudo apt install w3m
sudo apt install lynx
```

Open the browser and navigate to any URL to trigger the portal
``` bash
w3m http://example.com
```
Follow the prompts to enter the username/password on the captive portal.

If this doesn't work, terporalily install Midori or Chromium (lightweight GUI) to navigate the browser and sign in easily

``` linux

```

``` linux

```