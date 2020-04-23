/etc/init.d/bluetooth restart
bluetoothctl < /home/namperumal/blueman.txt
sleep 5s
pacmd set-default-sink bluez_sink.17_11_10_EC_08_31.a2dp_sink
