protocol
process: data

	| transformData |
	transformData := self encrypt: data.
	self basicProcess: transformData.
