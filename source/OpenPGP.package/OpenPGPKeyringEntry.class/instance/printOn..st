printing
printOn: aStream
	| key |
	super printOn: aStream.
	packets isEmpty ifTrue: [^self].
	key := packets first keyID printStringRadix: 16.
	key size < 8 ifTrue: [key := (String new: 8-key size withAll: $0), key].
	aStream nextPutAll: ', keyID='.
	aStream nextPutAll: key.
	aStream nextPutAll: ', created='.
	packets first printCreationDateAndTimeOn: aStream.
	packets do: [:each | each isUserIDPacket ifTrue: [aStream space; print: each dataAsString]]