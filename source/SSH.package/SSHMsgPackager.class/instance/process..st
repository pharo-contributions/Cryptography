protocol
process: data

	| transformData |
	transformData := self packagerState package: data.
	self basicProcess: transformData.
