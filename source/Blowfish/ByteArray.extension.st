Extension { #name : #ByteArray }

{ #category : #'*blowfish' }
ByteArray class >> fromHexString: aString [
	^ self readHexFrom: aString
]
