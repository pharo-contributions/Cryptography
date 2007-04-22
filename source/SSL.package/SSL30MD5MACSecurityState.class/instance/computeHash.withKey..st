as yet unclassified
computeHash: data withKey: key

	| digest1 result1 digest2 |
	digest1 := key, self pad1,
		(self connSecurityState sequenceNumber asByteArrayOfSize: 8),
		(data type asByteArrayOfSize: 1),
		(data length asByteArrayOfSize: 2),
		data fragment asByteArray.
	result1 := (MD5 hashMessage: digest1) asByteArray.
	digest2 := key, self pad2, result1.
	^ (MD5 hashMessage: digest2) asByteArray.
