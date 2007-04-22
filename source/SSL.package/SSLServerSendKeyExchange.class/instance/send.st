process
send

	| keyXchange |
	keyXchange := SSLServerKeyExchangeMsg new.
	self securityCoord setupServerKeyExchange: keyXchange.
	self sendHandshake: keyXchange.
