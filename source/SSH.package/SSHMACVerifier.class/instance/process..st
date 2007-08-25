protocol
process: data

	| transformData |
	transformData := self macState verifyMAC: data.
	self basicProcess: transformData.
