process
computeHash: data

	| digest buffer |
	buffer := (data type asByteArrayOfSize: 1),
		data version asByteArray,
		(data length asByteArrayOfSize: 2).
	digest := (self connSecurityState sequenceNumber asByteArrayOfSize: 8),
		buffer,
		data fragment.
	^ hMAC digestMessage: digest.
