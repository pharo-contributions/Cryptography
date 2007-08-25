protocol
process: data

	| transformData |
	transformData := self packagerState unpackage: data.
	self basicProcess: transformData.
