protocol
process: data

	| transformData |
	transformData := self decrypt: data.
	self basicProcess: transformData.
