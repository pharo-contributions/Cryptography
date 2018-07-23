instance creation
oidString: oidString

	^ self oid: (ASN1ObjectId fromString: oidString).
