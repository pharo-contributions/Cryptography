Extension { #name : #PositionableStream }

{ #category : #'*Cryptography-Core-core' }
PositionableStream >> nextUtfString [

	^ (self next: self uint16) asString.

]

{ #category : #'*Cryptography-Core-core' }
PositionableStream >> nextUtfStringPut: s [ 

	self uint16: s size.
	self nextPutAll: s asByteArray.

]
