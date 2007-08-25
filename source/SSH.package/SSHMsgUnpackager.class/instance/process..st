protocol
process: data

	| transformData |
	transformData := self macState unpackage: data.
	self basicProcess: transformData.
