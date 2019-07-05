Class {
	#name : #Pkcs8EncryptedPrivateKeyInfo,
	#superclass : #Object,
	#instVars : [
		'encryptionAlgorithm',
		'encryptedData'
	],
	#category : 'PKCS12'
}

{ #category : #api }
Pkcs8EncryptedPrivateKeyInfo >> cipherWithPassword: password [

	| salt iterations keyMaterial ivMaterial cipher |
	salt := self encryptionAlgorithm parameters first.
	iterations := self encryptionAlgorithm parameters last.

	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.1'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 16.
			cipher := ARC4 new key: keyMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.2'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 5.
			cipher := ARC4 new key: keyMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.3'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 24.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := TripleDES new key: keyMaterial.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.5'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 16.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := ARC2 key: keyMaterial effectiveKeyLength: 128.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	self encryptionAlgorithm oid oid = '1.2.840.113549.1.12.1.6'
		ifTrue: [
			keyMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 1 
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 5.
			ivMaterial := Pkcs12KeyDerivationFunction new
				derivedKeyWithId: 2
				fromPassword: password
				salt: salt
				iterations: iterations
				size: 8.
			cipher := ARC2 key: keyMaterial effectiveKeyLength: 40.
			cipher := cipher cbc initialVector: ivMaterial.
			^ cipher].
	^ nil
]

{ #category : #api }
Pkcs8EncryptedPrivateKeyInfo >> decryptWithPassword: password [

	| cipher asn1 |
	cipher := self cipherWithPassword: password.
	asn1 := cipher decrypt: self encryptedData.
	^ ASN1Stream 
		decodeBytes: asn1
		withType: ((ASN1Module name: #pkcs) find: #KeyBag)
]

{ #category : #accessing }
Pkcs8EncryptedPrivateKeyInfo >> encryptedData [
	"Answer the value of encryptedData"

	^ encryptedData
]

{ #category : #accessing }
Pkcs8EncryptedPrivateKeyInfo >> encryptedData: anObject [
	"Set the value of encryptedData"

	encryptedData := anObject
]

{ #category : #accessing }
Pkcs8EncryptedPrivateKeyInfo >> encryptionAlgorithm [
	"Answer the value of encryptionAlgorithm"

	^ encryptionAlgorithm
]

{ #category : #accessing }
Pkcs8EncryptedPrivateKeyInfo >> encryptionAlgorithm: anObject [
	"Set the value of encryptionAlgorithm"

	encryptionAlgorithm := anObject
]
