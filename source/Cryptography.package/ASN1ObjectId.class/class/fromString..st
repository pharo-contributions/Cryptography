asn
fromString: oidString

	^ self new
		oid: oidString;
		initializeDescription;
		yourself