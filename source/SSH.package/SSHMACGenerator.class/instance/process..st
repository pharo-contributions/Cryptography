protocol
process: data

	| transformData |
	transformData := self macState generateMAC: data.
	self basicProcess: transformData.
