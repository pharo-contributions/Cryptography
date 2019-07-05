"
A S2KSpecifier encodes how cleartext passphrases are converted into encryption keys. See RFC2440 for more info.

Instance Variables:
type			<Integer> 0, 1, or 3. Only 3 is currently supported (iterated and salted s2k)
hashAlgorithm	<Integer> for the hashing algorithm. Only 2 is currently supported (SHA)
salt				<ByteArray> 8 bytes for 'salting' the hashing machinery so that the same passphrase will not yield the same hash.
count			<Integer> number of bytes of repeated passphrase data to process
"
Class {
	#name : #OpenPGPS2KSpecifier,
	#superclass : #Object,
	#instVars : [
		'type',
		'hashAlgorithm',
		'salt',
		'count'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPS2KSpecifier >> count [
	^count
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> hashAlgorithm [
	^hashAlgorithm
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> hashBytes [
	^20
]

{ #category : #reading }
OpenPGPS2KSpecifier >> readFrom: aStream [
	type := aStream next.
	(#(0 1 3) includes: type) ifFalse: [self error: 'Unknown string-to-key specifier'].
	hashAlgorithm := aStream next.
	(type bitAnd: 1) = 1 ifTrue: [salt := aStream next: 8].
	(type bitAnd: 2) = 2 ifTrue: [
		count := aStream next.
		count := count \\ 16 + 16 bitShift: count // 16 + 6]
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> salt [
	^salt
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> stringToKey: aString numBytes: numBytes [
	| b i hash |
	b := 0.
	i := 0.
	hash := 0.
	[b < numBytes] whileTrue: [
		hash := (hash bitShift: self hashBytes * 8) + (self stringToKey: aString preload: i).
		b := b + self hashBytes.
		i := i + 1].
	b > numBytes ifTrue: [hash := hash bitShift: (numBytes - b) * 8].
	"1 to: hash digitLength // 2 do: [:j |
		t := hash digitAt: j.
		hash digitAt: j put: (hash digitAt: hash digitLength+1-j).
		hash digitAt: hash digitLength+1-j put: t]."
	^hash
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> stringToKey: aString preload: num [
	| message i |
	(type = 3 and: [hashAlgorithm = 2]) ifFalse: [
		self error: 'Only SHA-1 supported at the moment'].
	message := ByteArray new: (count max: aString size + salt size) + num.
	i := 1 + num.
	[i <= message size] whileTrue: [
		message
			replaceFrom: i
			to: (i + salt size-1 min: message size)
			with: salt
			startingAt: 1.
		i := i + salt size.
		i <= message size ifTrue: [
			message
				replaceFrom: i
				to: (i + aString size-1 min: message size)
				with: aString
				startingAt: 1.
			i := i + aString size]].
	^SecureHashAlgorithm new hashMessage: message
]

{ #category : #accessing }
OpenPGPS2KSpecifier >> type [
	^type
]
