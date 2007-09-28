process
asByteArray

	^ super asByteArray, 
		(self nameListOn: self authentications),
		(self partialSuccess ifTrue: [#(1)] ifFalse: [#(0)]).
