# Mythical Pump (from Kongou Media Project)
# by Yukimi Kazari

# This is used to transcode and pump data from Wannai TV Backend to the NSS Storage Array for Plex

if [ -f /opt/ready.txt ]
then
rm /opt/ready.txt
echo ""
echo "Wannai MythPump v0.4"
######echo "---- Links ----"
######/usr/share/doc/mythtv-backend/contrib/user_jobs/mythlink.pl --live --link /NSS/link/tv --format '%T/%T - %S (%oY-%om-%od)' --verbose
echo "---- Sync ----"
echo "Connecting to NuStor....."
mount /NSS/link/tv2
if [ -a "/NSS/link/tv2/ready.txt" ]
then
echo "CONNECTED! SYSTEM IS READY!"
######echo "Uploading Recordings....."
echo "Pumping data to Kongou.....(This will take some time to transcode)"
cd /opt
python3 /opt/mythPlex.py
rsync -rauLI --progress /var/lib/mythtv/trans/ /NSS/link/tv2/Recorded\ TV/WTV2/
sleep 30
rm -rf /var/lib/mythtv/trans/T*
echo "COMPLETE"
else
echo "CONNECTION FAILED TO VERIFY!"
fi
umount /NSS/link/tv2 -l
echo "Disconnected!"
echo "Job Complete!"
echo "" > /opt/ready.txt
else
echo "CALL WAS TAKEN BUT JOB ACTIVE! ABORTED!"
fi
