# Save battery level

perl /home/pi/rpi-offgrid/scripts/saveBattery.pl /home/pi/osm-extract/LOG

cd /home/pi/rpi-offgrid/osm/

# Update data
perl update.pl


# Commit changes to Github
./update.sh

# Wait before shutting down
/bin/sleep 60; /home/pi/rpi-offgrid/scripts/shutdown.py
