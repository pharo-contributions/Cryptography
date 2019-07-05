Class {
	#name : #OFB,
	#superclass : #BlockCipherMode,
	#category : 'Cryptography-Core'
}

{ #category : #private }
OFB >> advanceVector [
	cipher encryptBlock: vector
]

{ #category : #accessing }
OFB >> decryptBlock: aByteArray [
	"One of the nice attributes of OFB is there is no difference between the encrypt and decrypt implementations."
	^ self encryptBlock: aByteArray
]

{ #category : #accessing }
OFB >> encryptBlock: aByteArray [
	self advanceVector.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: ((aByteArray at: x) bitXor: (vector at: x)) ]
]

{ #category : #testing }
OFB >> isStreamCipher [
	^ true
]
