# Mythical Pump (from Kongou Media Project)
# by Yukimi Kazari

# This is used to transcode and pump data from Wannai TV Backend to the NSS Storage Array for Plex

echo ""
echo "Wannai MythPump v0.4"
#echo "---- Links ----"
#/usr/share/doc/mythtv-backend/contrib/user_jobs/mythlink.pl --live --link /NSS/link/tv --format '%T/%T - %S (%oY-%om-%od)' --verbose
echo "---- Sync ----"
echo "Connecting to NuStor....."
mount /NSS/link/tv2
if [ -a "/NSS/link/tv2/ready.txt" ]; then
echo "Connected!"
#echo "Uploading Recordings....."
echo "Working with TV Shows....."
python3 /opt/mythPlex.py
#rsync -rauL --progress /NSS/link/tv/ /NSS/video/Recorded\ TV/Current/
echo "Complete"
else
echo "CONNECTION FAILED TO VERIFY!"
fi
umount /NSS/link/tv2 -l
echo "Disconnected!"
echo "Job Complete!"
