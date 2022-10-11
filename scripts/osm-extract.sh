# Save battery level

perl saveBattery.pl /mnt/Trifle/osm-extract/LOG

cd /mnt/Trifle/osm-extract/

# Update data
perl update.pl


# Commit changes to Github
./update.sh

# Wait before shutting down
/bin/sleep 60; /mnt/Trifle/rpi-offgrid/scripts/shutdown.py
