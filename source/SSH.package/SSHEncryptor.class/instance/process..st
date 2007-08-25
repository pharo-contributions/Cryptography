protocol
process: data

	| transformData |
	transformData := self cipherState encrypt: data.
	self basicProcess: transformData asByteArray.
