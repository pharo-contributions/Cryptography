protocol
process: data

	| transformData |
	transformData := self compress: data.
	self basicProcess: transformData.
