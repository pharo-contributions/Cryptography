instance creation
oidString: oidString parameters: params

	^ self oid: (ASN1ObjectId fromString: oidString) parameters: params.
