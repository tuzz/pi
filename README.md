## Raspberry Pi

I use this repository for bootstrapping my pi. It means I can teardown and rebuild a fresh system quickly and repeatably. You're welcome to fork this repo and configure for your own needs.

## Setup

Install the latest Raspbian image by following [these instructions](http://www.raspberrypi.org/documentation/installation/installing-images/).

Insert your SD card, connect to ethernet and power up.

After a few seconds, run the setup script.

```bash
ssh pi@raspberrypi 'bash <(curl -L raw.github.com/tuzz/pi/master/setup.sh)'
# raspberry
```

This will take a long time, so grab a snickers.

Your pi will reboot once it's done.
