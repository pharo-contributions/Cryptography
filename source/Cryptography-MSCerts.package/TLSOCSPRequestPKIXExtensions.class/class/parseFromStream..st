parsing
parseFromStream: aStream 
	"Return a collection of responders encoded in aStream"
	| result extensionStream |
	result _ OrderedCollection new.
	extensionStream _ (aStream next: aStream next asInteger) readStream.
	[extensionStream atEnd]
		whileFalse: [result add: (self new rawData: (extensionStream next: extensionStream next asInteger))].
	^ result