process
setupServerKeyExchange: serverKE forCoord: coord

	| serverParams |
	diffieHellman := DiffieHellman bits: 256.
	serverParams := ServerDHParams new.
	serverKE serverParams: serverParams.
	serverParams
		p: diffieHellman prime asByteArray;
		g: diffieHellman generator asByteArray;
		yServer: diffieHellman sendMessage asByteArray.


