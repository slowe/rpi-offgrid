# Setting up PiJuice

The [PiJuice](https://uk.pi-supply.com/products/pijuice-standard) provides a battery pack for a Raspberry Pi with 40 GPIO pins. [PiJuice Documentation](https://github.com/PiSupply/PiJuice/tree/master/Documentation), [PiJuice Software](https://github.com/PiSupply/PiJuice/tree/master/Software), and notes about the [hardware](https://github.com/PiSupply/PiJuice/tree/master/Hardware).


Set up the PiJuice GUI

```
sudo apt-get install pijuice-gui
```

In the GUI make sure the battery is set up correctly, set the wakeup alarm for 08:59 every day, set the `USER FUNC1` to `/mnt/Trifle/rpi-offgrid/scripts/shutdown.py`.


Due to hardware issues, the PiJuice's wakeup alarm gets disabled by the Pi on startup. So we update `cron` to make sure it gets re-enabled for next time. Edit crontab with `crontab -e` then add the following line:

```
@reboot /bin/sleep 30; /usr/bin/python3 /home/pi/PiJuice/Software/Test/wakeup_enable.py
```

Here we've added `/bin/sleep 30;` to make sure the RaspberryPi has set things up before enabling the wakeup.


Run the OSM Extract updater code:

```
0 9 * * * /bin/sleep 30; /mnt/Trifle/rpi-offgrid/scripts/osm-extract.sh
```

### How to run a user script in PiJuice

https://learn.pi-supply.com/make/how-to-run-a-user-script-with-the-pijuice-power-events/
