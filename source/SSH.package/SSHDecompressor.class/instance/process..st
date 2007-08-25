protocol
process: data

	| transformData |
	transformData := self compressionState decompress: data.
	self basicProcess: transformData.
