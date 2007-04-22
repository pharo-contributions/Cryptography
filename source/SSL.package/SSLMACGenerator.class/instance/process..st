protocol
process: data

	| transformData |
	transformData := self generateMAC: data.
	self basicProcess: transformData.
