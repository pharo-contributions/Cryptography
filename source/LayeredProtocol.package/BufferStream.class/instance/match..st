accessing
match: aString
	self size < aString size
		ifTrue: [^false].
	(self next: aString size) = aString
		ifTrue: [^true]
		ifFalse: [self on: aString, self upToEnd].
	^false