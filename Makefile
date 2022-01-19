run10:
	/tmp/mirthstuff/mirthconnect_3_10_1/mcserver

run12:
	/tmp/mirthstuff/mirthconnect_3_12_0/mcserver

reset:
	rm -rf /tmp/mirthstuff

upgrade:
	cp /tmp/mirthstuff/mirthconnect_3_10_1/appdata/extensions.properties /tmp/mirthstuff/mirthconnect_3_12_0/appdata/
	cp /tmp/mirthstuff/mirthconnect_3_10_1/appdata/keystore.jks /tmp/mirthstuff/mirthconnect_3_12_0/appdata/
	cp /tmp/mirthstuff/mirthconnect_3_10_1/appdata/keystore.jks /tmp/mirthstuff/mirthconnect_3_12_0/appdata/
