parsing
parseFromStream: aStream 
	"Return a collection of responders encoded in aStream"
	| result |
	result _ OrderedCollection new.
	[aStream atEnd]
		whileFalse: [result add: (self new
					responderID: (aStream next: (aStream next: 2));
					 yourself)].
	^ result