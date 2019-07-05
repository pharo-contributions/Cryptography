Extension { #name : #PositionableStream }

{ #category : #'*cryptography-core' }
PositionableStream >> nextUtfString [

	^ (self next: self uint16) asString.

]

{ #category : #'*cryptography-core' }
PositionableStream >> nextUtfStringPut: s [ 

	self uint16: s size.
	self nextPutAll: s asByteArray.

]
