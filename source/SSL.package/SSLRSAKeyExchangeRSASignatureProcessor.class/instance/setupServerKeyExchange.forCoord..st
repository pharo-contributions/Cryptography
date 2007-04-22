process
setupServerKeyExchange: serverKE forCoord: coord


"
	| serverParams rsa |
	rsa := RSAKeyPairGenerator bits: 1024.
	publicKey := rsa publicKey.
	privateKey := rsa privateKey. 
	serverParams := ServerRSAParams new.
	serverKE serverParams: serverParams.
	serverParams
		modulus: publicKey modulo asByteArray;
		exponent: publicKey exponent asByteArray.
"

