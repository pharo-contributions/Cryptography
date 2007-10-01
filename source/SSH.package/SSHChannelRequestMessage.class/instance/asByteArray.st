process
asByteArray

	| bytes |
	bytes := super asByteArray, 
		(self recipientChannel asByteArrayOfSize: 4),
		(self stringOn: self requestType),
		(self wantReply ifTrue: [#(1)] ifFalse: [#(0)]).
	self subMsg notNil ifTrue: [
		bytes := bytes, self subMsg asByteArray].
	^ bytes