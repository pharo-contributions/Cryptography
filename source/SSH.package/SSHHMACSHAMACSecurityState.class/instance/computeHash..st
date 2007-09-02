process
computeHash: data

	| digest |
	digest := (self connSecurityState sequenceNumber asByteArrayOfSize: 4), 
		(data packetLength asByteArrayOfSize: 4), 
		data paddingLength asByteArray, 
		data payload, 
		data padding.
	^ hMAC digestMessage: digest.
