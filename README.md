# WinWifiBruteForce

This is intended to be used with the [HackThisWifi project](https://hackthiswifi.patrickmccanna.net)

A powershell script for bruteforcing the credential of a wifi network.  This script is useful for Windows Users just getting started on learning about wifi security.  

This is intended to be used with the [HackThisWifi project](https://hackthiswifi.patrickmccanna.net)


## Script Overview
This script reads a passwords list.  

It creates a wifi profile xml file for a windows netsh command.  

The profile specifies the wifi target ssid of HackThisWifi.  The script modifies the file to use the current wifi key guess.  

The script uses the wifi profile file to attempt to attach to the wifi network with the new password.  

If the netsh command successfully attaches:
1. we'll see a "State connected" message when the command runs 
2. the script will report back the password that worked during the connection attempt.  

This script expects a passwords.txt file in the working directory of the script.  

I leave it as an exercise for the reader to locate their own passwords lists, but I've included a sample dummy file with a limited number of passwords


# Running the Brute Forcer
```
./WinWifiBruteForcer.ps1
```

you can launch powershell in windows by clicking on the Search Icon and typing "powershell"

You could copy and paste these files in your system, or you could:

## Install Git

[Install Git](https://www.github.com/git-guides/install-git)

## Create your hacking directory from powershell:

```
mkdir hacking
```
## change directories into the hacking directory:
```
cd hacking
```
## clone the repository:
```
git clone https://github.com/CaptainMcCrank/WinWifiBruteForce.git  
```
[Install Git](https://www.github.com/git-guides/install-git)

You might find this video helpful on the [git clone](https://youtu.be/aHMPn57ZmJo) command.




# FAQ
1. How did you generate the Wifi profile?

I used a windows workstation to attach to the wifi network with the correct password.
I then used the following command to list the current profiles:
```
netsh wlan show profiles
```

I then used the following command to export the profile:

```
netsh wlan export profile key=clear folder="FOLDER-PATH"
```

I used the resulting file as a template for generating the correct password.  The one manual step that someone without forknowledge needs to take is to use the following command to get the hex value for the ssid:
```
'HackThisWifi' | Format-Hex
```
