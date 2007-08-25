protocol
process: data

	| transformData |
	transformData := self cipherState decrypt: data.
	self basicProcess: transformData.
