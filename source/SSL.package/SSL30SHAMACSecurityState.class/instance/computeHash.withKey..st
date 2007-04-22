process
computeHash: data withKey: key

	| digest1 result1 digest2 result2 |
	digest1 := key, self pad1,
		(self connSecurityState sequenceNumber asByteArrayOfSize: 8),
		(data type asByteArrayOfSize: 1),
		(data length asByteArrayOfSize: 2),
		data fragment asByteArray.
	result1 := SHA1 hashMessage: digest1.
	digest2 := key, self pad2, result1.
	result2 := SHA1 hashMessage: digest2.
"
Transcript cr; cr; show: 'macSecret:   ', key hex.
Transcript cr; show: 'seq:   ', (self connSecurityState sequenceNumber asByteArrayOfSize: 8) hex.
Transcript cr; show: 'type:   ', (data type asByteArrayOfSize: 1) hex.
Transcript cr; show: 'length:   ', (data length asByteArrayOfSize: 2) hex.
Transcript cr; show: 'macInput:   ', data fragment hex.
Transcript cr; show: 'macOutput:   ', result2 hex.
"
	^ result2
