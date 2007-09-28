process
asByteArray

	| bytes |
	bytes := super asByteArray, 
		(self numResponses asByteArrayOfSize: 4).
	self responses do: [:response |
		bytes := bytes, (self stringOn: response)].
	^ bytes
