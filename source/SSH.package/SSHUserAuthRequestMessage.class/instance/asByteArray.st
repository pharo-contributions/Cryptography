process
asByteArray

	| bytes |
	bytes := super asByteArray, 
		(self stringOn: self userName),
		(self stringOn: self serviceName),
		(self stringOn: self methodName).
	self subMsg notNil ifTrue: [
		bytes := bytes, self subMsg asByteArray].
	^ bytes