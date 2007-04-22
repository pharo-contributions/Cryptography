process
setupServerKeyExchange: serverKE forCoord: coord

	| chunk toBeSigned sig bytes |
	super setupServerKeyExchange: serverKE forCoord: coord.
	chunk := coord securityParams clientRandom, coord securityParams serverRandom, serverKE serverParams asByteArray.
	toBeSigned := SHA1 hashMessage: chunk.
	sig := privateKey computeSignatureForMessageHash: toBeSigned.
	bytes := sig asAsn1Bytes.
	serverKE signature: (bytes size asByteArrayOfSize: 2), bytes.
