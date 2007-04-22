process
setupClientKeyExchange: clientKE forCoord: coord

	| exchange |
	exchange := ClientDiffieHellmanPublic new.
	clientKE exchangeKeys: exchange.
	exchange yClient: diffieHellman sendMessage asByteArray.
	diffieHellman receiveMessage: yServer.
