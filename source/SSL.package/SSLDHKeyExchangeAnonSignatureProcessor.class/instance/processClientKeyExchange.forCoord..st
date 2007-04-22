process
processClientKeyExchange: clientKE forCoord: coord

	| exchange |
	exchange := clientKE exchangeKeys.
	diffieHellman receiveMessage: exchange yClient asInteger.
