Class {
	#name : #Pkcs12KeyDerivationFunction,
	#superclass : #Object,
	#category : 'PKCS12'
}

{ #category : #private }
Pkcs12KeyDerivationFunction >> copyResult: result toBufferOfSize: bufferSize [

	| buffer |
	buffer := ByteArray new: bufferSize.
	0 to: bufferSize-1 do: [:i | buffer at: i + 1 put: (result at: (i \\ result size + 1))].
	^ buffer

]

{ #category : #'as yet unclassified' }
Pkcs12KeyDerivationFunction >> derivedKeyWithId: id fromDoubleBytePassword: passIn salt: saltIn iterations: iterate size: size [

	| password salt diversifier initial final digest v u pLen sLen c k buffer ij |
	v := 64.
	u := 20.
	diversifier := ByteArray new: v withAll: id.
	pLen := v * (passIn size + v - 1 // v).
	sLen := v * (saltIn size + v - 1 // v).
	k := (passIn size + v - 1 // v) + (saltIn size + v - 1 // v).

	password := self passwordBufferFromPassword: passIn length: pLen.
	salt := self saltBufferFromSalt: saltIn length: sLen.
	initial := salt, password.
	c := size + u - 1 // u.
	final := ByteArray new.
	1 to: c do: [:idx |
		digest := diversifier, initial.
		iterate timesRepeat: [digest := SHA1 hashMessage: digest].
		final := final, digest.
		buffer := self copyResult: digest toBufferOfSize: v.
		0 to: k - 1 do: [:j |
			ij := initial copyFrom: v*j + 1 to: v*(j+1).
			ij := (ij asInteger + buffer asInteger + 1) asByteArray.
			ij size > v ifTrue: [ij := ij copyFrom: 2 to: v+1].
			ij size < v ifTrue: [ij := ij, (ByteArray new: v - ij size withAll: 0)].
			initial replaceFrom: v*j + 1 to: v*(j+1) with: ij]].
	^ final copyFrom: 1 to: size.
]

{ #category : #'as yet unclassified' }
Pkcs12KeyDerivationFunction >> derivedKeyWithId: id fromPassword: passIn salt: saltIn iterations: iterate size: size [

	| stream password |
	stream := WriteStream on: ByteArray new.
	passIn do: [:e | stream nextPut: 0; nextPut: e asciiValue].
	password := stream nextPut: 0; nextPut: 0; contents.

	^ self 
		derivedKeyWithId: id 
		fromDoubleBytePassword: password
		salt: saltIn 
		iterations: iterate 
		size: size
]

{ #category : #private }
Pkcs12KeyDerivationFunction >> passwordBufferFromPassword: pass length: pLen [

	| password |
	password := ByteArray new: pLen.
	0 to: pLen-1 do: [:i | password at: i + 1 put: (pass at: (i \\ pass size + 1))].
	^ password
]

{ #category : #private }
Pkcs12KeyDerivationFunction >> saltBufferFromSalt: saltIn length: sLen [

	| salt |
	salt := ByteArray new: sLen.
	0 to: sLen-1 do: [:i | salt at: i + 1 put: (saltIn at: (i \\ saltIn size + 1))].
	^ salt

]
