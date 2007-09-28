process
asByteArray

	^ super asByteArray, 
		(self recipientChannel asByteArrayOfSize: 4),
		(self stringOn: self requestType),
		(self wantReply ifTrue: [#(1)] ifFalse: [#(0)]).
