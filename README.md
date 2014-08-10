## Raspberry Pi

I use this repository for bootstrapping my pi. It means I can teardown and rebuild a fresh system quickly and repeatably. You're welcome to fork this repo and configure for your own needs.

## Setup

Install the latest Raspbian image by following [these instructions](http://www.raspberrypi.org/documentation/installation/installing-images/).

Insert your SD card, connect to ethernet and power up.

After a few seconds, you should be able to SSH to your pi.

```bash
ssh pi@raspberrypi
# raspberry
```

Next, let's install chef.

```bash
sudo apt-get update
sudo apt-get install -y chef
```

You will be prompted for a chef server. Just hit enter.

Finally, clone this repository and run chef.

```bash
sudo rm -rf /etc/chef
sudo git clone https://github.com/tuzz/pi /etc/chef
sudo chef-solo
```
