process
processServerKeyExchange: serverKE forCoord: coord

	| serverParams |
	serverParams := serverKE serverParams.
	diffieHellman := DiffieHellman 
		prime: serverParams p asInteger 
		generator: serverParams g asInteger.
	yServer := serverParams yServer asInteger.
