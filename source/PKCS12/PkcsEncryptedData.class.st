Class {
	#name : #PkcsEncryptedData,
	#superclass : #Object,
	#instVars : [
		'version',
		'encryptedContentInfo'
	],
	#category : 'PKCS12'
}

{ #category : #decrypting }
PkcsEncryptedData >> decryptWithPassword: password [

	^ self encryptedContentInfo decryptWithPassword: password.

]

{ #category : #accessing }
PkcsEncryptedData >> encryptedContentInfo [
	"Answer the value of encryptedContentInfo"

	^ encryptedContentInfo
]

{ #category : #accessing }
PkcsEncryptedData >> encryptedContentInfo: anObject [
	"Set the value of encryptedContentInfo"

	encryptedContentInfo := anObject
]

{ #category : #accessing }
PkcsEncryptedData >> version [
	"Answer the value of version"

	^ version
]

{ #category : #accessing }
PkcsEncryptedData >> version: anObject [
	"Set the value of version"

	version := anObject
]
