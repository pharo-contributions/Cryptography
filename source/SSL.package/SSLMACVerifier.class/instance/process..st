protocol
process: data

	| transformData |
	transformData := self verifyMAC: data.
	self basicProcess: transformData.
