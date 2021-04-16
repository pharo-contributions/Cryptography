Class {
	#name : #ASN1Stream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'currentTag'
	],
	#classVars : [
		'TagToTypeDispatchTable'
	],
	#category : #'ASN1-Core-ASN1-Core'
}

{ #category : #decoding }
ASN1Stream class >> decodeBytes: bytes [

	^ (self onBytes: bytes) decode
]

{ #category : #decoding }
ASN1Stream class >> decodeBytes: bytes withType: type [

	^ (self onBytes: bytes) decodeWithType: type
]

{ #category : #encoding }
ASN1Stream class >> encode: object [

	^ self new encode: object
]

{ #category : #encoding }
ASN1Stream class >> encode: object withType: type [

	^ self new encode: object withType: type
]

{ #category : #'class initialization' }
ASN1Stream class >> initializeTagToTypeDispatchTable [

	TagToTypeDispatchTable := Dictionary new.
	TagToTypeDispatchTable
"		at: 0 put: ASN1EndOfIndefiniteLengthType new;"
		at: 1 put: ASN1BooleanType new;
		at: 2 put: ASN1IntegerType new;
		at: 3 put: ASN1BitStringType new;
		at: 4 put: ASN1ByteArrayType new;
		at: 5 put: ASN1NullType new;
		at: 6 put: ASN1ObjectIdentifierType new;
		at: 12 put: ASN1StringType new;
		at: 16 put: ASN1SequenceType new;
		at: 17 put: ASN1SetType new;
		at: 19 put: ASN1PrintableStringType new;
		at: 20 put: ASN1TeletexStringType new;
		at: 22 put: ASN1IA5StringType new;
		at: 23 put: ASN1UTCTimeType new;
		at: 26 put: ASN1VisibleStringType new;
		at: 27 put: ASN1GeneralStringType new;
		at: 28 put: ASN1UniversalStringType new;
		at: 30 put: ASN1BMPStringType new;
		yourself.

]

{ #category : #'instance creation' }
ASN1Stream class >> new [

	^ self onStream: (ByteArray new: 100) writeStream.

]

{ #category : #'instance creation' }
ASN1Stream class >> onBytes: bytes [

	^ self onStream: bytes readStream.

]

{ #category : #'instance creation' }
ASN1Stream class >> onStream: aStream [

	^ super new
		stream: aStream;
		yourself.

]

{ #category : #'class initialization' }
ASN1Stream class >> tagToTypeDispatchTable [

	TagToTypeDispatchTable isNil ifTrue: [self initializeTagToTypeDispatchTable].
	^ TagToTypeDispatchTable

]

{ #category : #'stream - api' }
ASN1Stream >> atEnd [

	^ self stream atEnd
]

{ #category : #'stream - api' }
ASN1Stream >> contents [

	^ self stream contents
]

{ #category : #accessing }
ASN1Stream >> currentTag [
	"Answer the value of currentTag"

	^ currentTag
]

{ #category : #accessing }
ASN1Stream >> currentTag: anObject [
	"Set the value of currentTag"

	currentTag := anObject
]

{ #category : #decoding }
ASN1Stream >> decode [

	| tag numericTag type tagClass isConstructed |
	tag := self peekTag.
	numericTag := tag bitAnd: 2r00011111.
	tagClass := tag bitAnd: 2r11000000.
	isConstructed := (tag bitAnd: 2r00100000) > 0.
	tagClass > 0
		ifTrue: [isConstructed
			ifTrue: [type := ASN1WrapperConstructedType new]
			ifFalse: [type := ASN1WrapperPrimitiveType new]]
		ifFalse: [type := self class tagToTypeDispatchTable at: numericTag].
	^ self decodeWithType: type.

]

{ #category : #decoding }
ASN1Stream >> decodeWithType: type [

	^ type decodeWithDERStream: self.

]

{ #category : #encoding }
ASN1Stream >> encode: anObject [

	| type tag numericTag tagClass isConstructed |
	tag := anObject asn1Tag.
	numericTag := tag bitAnd: 2r00011111.
	tagClass := tag bitAnd: 2r11000000.
	isConstructed := (tag bitAnd: 2r00100000) > 0.
	tagClass > 0
		ifTrue: [isConstructed
			ifTrue: [type := ASN1WrapperConstructedType new]
			ifFalse: [type := ASN1WrapperPrimitiveType new]]
		ifFalse: [type := self class tagToTypeDispatchTable at: numericTag].
	^ self encode: anObject withType: type.

]

{ #category : #encoding }
ASN1Stream >> encode: anObject withType: type [

	type encode: anObject withDERStream: self.
	^ self contents

]

{ #category : #'stream - api' }
ASN1Stream >> newStream [

	^ self class new
]

{ #category : #'stream - api' }
ASN1Stream >> next [

	^ self stream next
]

{ #category : #'stream - api' }
ASN1Stream >> next: num [

	^ self stream next: num
]

{ #category : #'stream - api' }
ASN1Stream >> nextLength [

	| tag val |
	tag := self stream next.
	tag = 2r10000000 
		ifTrue: [^ -1].
	((tag bitAnd: 2r10000000) > 0)
		ifTrue: [
			val := 0.
			(tag bitClear: 2r10000000) timesRepeat: [
				val := (val bitShift: 8) + self stream next].
			^ val]
		ifFalse: [^ tag].

]

{ #category : #'stream - api' }
ASN1Stream >> nextPut: byte [

	^ self stream nextPut: byte
]

{ #category : #'stream - api' }
ASN1Stream >> nextPutAll: bytes [

	^ self stream nextPutAll: bytes
]

{ #category : #'stream - api' }
ASN1Stream >> nextPutLength: size [

	size <= 127 
		ifTrue: [self nextPut: size]
		ifFalse: [
			self nextPut: ((size bytesCount) bitOr: 16r80).
			size bytesCount to: 1 by: -1 do: [:digitIndex |
				self nextPut: (size byteAt: digitIndex)]]

]

{ #category : #'stream - api' }
ASN1Stream >> nextPutTag: tag [
	"It's not clear how to encode a tag whose numerical value is greater than 30"

	self nextPut: tag.

]

{ #category : #'stream - api' }
ASN1Stream >> nextTag [

	| tag octet |
	tag := self stream next.
	((tag bitAnd: 2r00011111) == 2r00011111)
		ifTrue: [
			tag := 0.
			[
				octet := self stream next.
				tag := (tag bitShift: 7) bitOr: (octet bitClear: 2r10000000).
				(octet bitAnd: 2r10000000) > 0] 
					whileTrue].
	self currentTag: tag.
	^ tag
]

{ #category : #'stream - api' }
ASN1Stream >> peekTag [

	| start |
	start := self position.
	^[self nextTag] ensure: [self position: start]
]

{ #category : #'stream - api' }
ASN1Stream >> position [

	^ self stream position
]

{ #category : #'stream - api' }
ASN1Stream >> position: pos [

	^ self stream position: pos
]

{ #category : #'stream - api' }
ASN1Stream >> size [

	^ self stream size
]

{ #category : #accessing }
ASN1Stream >> stream [
	"Answer the value of stream"

	^ stream
]

{ #category : #accessing }
ASN1Stream >> stream: anObject [
	"Set the value of stream"

	stream := anObject
]
