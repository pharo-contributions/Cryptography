conversions
asByteArray

	| bytes |
	bytes := (self newPassword notNil ifTrue: [#(1)] ifFalse: [#(0)]) asByteArray,
		(self stringOn: self password).
	self newPassword notNil
		ifTrue: [
			bytes := bytes, (self stringOn: self newPassword)].
	^ bytes
