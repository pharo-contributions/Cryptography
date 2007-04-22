process
processServerKeyExchange: serverKE forCoord: coord

	| chunk toBeSigned stream bytes sig |
	super processServerKeyExchange: serverKE forCoord: coord.
	stream := serverKE signature readStream.
	bytes := stream next: (stream next: 2) asInteger.
	sig := ASN1Stream decodeBytes: bytes.
	chunk := coord securityParams clientRandom, 
		coord securityParams serverRandom, 
		serverKE serverParams asByteArray.
	toBeSigned := SHA1 hashMessage: chunk.
	(publicKey verifySignature: sig ofMessageHash: toBeSigned)
		ifFalse: [coord sendAlertCode: 40]
	
