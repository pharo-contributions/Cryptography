process
processServerKeyExchange: serverKE forCoord: coord

	| chunk stream sig encodedMsg |
	super processServerKeyExchange: serverKE forCoord: coord.
	stream := serverKE signature readStream.
	sig := stream next: (stream next: 2) asInteger.
	chunk := coord securityParams clientRandom, coord securityParams serverRandom, serverKE serverParams asByteArray.
	encodedMsg := (MD5 hashMessage: chunk), (SHA1 hashMessage: chunk).
	(publicKey v15VerifySignature: sig ofMessageHash: encodedMsg)
		ifFalse: [coord sendAlertCode: 40]
