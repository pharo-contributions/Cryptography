protocol
process: data

	| transformData |
	transformData := self compressionState compress: data.
	self basicProcess: transformData.
