protocol
process: data

	| transformData |
	transformData := self decompress: data.
	self basicProcess: transformData.
