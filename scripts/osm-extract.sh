# Save battery level

perl /home/pi/rpi-offgrid/scripts/saveBattery.pl /home/pi/osm-extract/LOG

cd /home/pi/osm-extract/

# Update data
perl update.pl

# Commit changes to Github
./update.sh

# Wait before shutting down
/home/pi/rpi-offgrid/scripts/shutdown.py
