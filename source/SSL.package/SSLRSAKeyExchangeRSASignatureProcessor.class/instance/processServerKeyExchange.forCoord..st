process
processServerKeyExchange: serverKE forCoord: coord

"
	| serverParams |
	serverParams := serverKE serverParams.
	publicKey := RSAKey 
		exponent: serverParams exponent asInteger 
		modulo: serverParams modulus asInteger.
"