Class {
	#name : #CryptoASN1Test,
	#superclass : #TestCase,
	#category : 'ASN1-Tests'
}

{ #category : #'tests - base' }
CryptoASN1Test >> testBMPString [

	| bytes obj newBytes testObj |
	bytes := #(30 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testBaseExplicitType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) explicit: #TestExplicit type: #ASN1IntegerType tag: 0.

	type := (ASN1Module name: #test) find: #TestExplicit.
	bytes := #(160 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testBaseImplicitConstructedType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) implicit: #TestImplicit type: #ASN1SequenceType tag: 0.

	type := (ASN1Module name: #test) find: #TestImplicit.
	bytes := #(160 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj = (OrderedCollection with: 789)).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testBaseImplicitPrimitiveType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) implicit: #TestImplicit type: #ASN1IntegerType tag: 0.

	type := (ASN1Module name: #test) find: #TestImplicit.
	bytes := #(128 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testBitString [

	| bytes obj newBytes testObj |
	bytes := #(3 3 3 168 121).
	testObj := ASN1BitString new 
		bytes: #(168 121); 
		bitsPadding: 3; 
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testBoolean [

	| bytes obj newBytes testObj |
	bytes := #(1 1 255).
	testObj := true.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testByteArray [

	| bytes obj newBytes testObj |
	bytes := #(4 5 3 21 55 43 76).
	testObj := #(3 21 55 43 76) asByteArray.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedBMPString [

	| bytes obj testObj |
	bytes := #(62 15 30 5 84 101 115 116 32 30 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedBitString [

	| bytes obj testObj |
	bytes := #(35 9 3 3 0 110 93 3 2 6 192).
	testObj := ASN1BitString new
		bytes: #(110 93 192) asByteArray;
		bitsPadding: 6;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedByteArray [

	| bytes obj testObj |
	bytes := #(36 12 4 4 1 35 69 103 4 4 137 171 205 239).
	testObj :=#(1 35 69 103 137 171 205 239) asByteArray.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedIA5String [

	| bytes obj testObj |
	bytes := #(54 15 22 5 84 101 115 116 32 22 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedPrintableString [

	| bytes obj testObj |
	bytes := #(51 15 19 5 84 101 115 116 32 19 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedTeletexString [

	| bytes obj testObj |
	bytes := #(52 15 20 5 84 101 115 116 32 20 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedUTF8String [

	| bytes obj testObj |
	bytes := #(44 15 12 5 84 101 115 116 32 12 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testConstructedUniversalString [

	| bytes obj testObj |
	bytes := #(60 15 28 5 84 101 115 116 32 28 6 85 115 101 114 32 49).
	testObj := 'Test User 1'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedAnyDefinedByType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1ObjectIdentifierType;
		add: #testSlot2 type: #TestAnyDefinedBy;
		yourself.
	((ASN1Module name: #test) any: #TestAnyDefinedBy definedBy: #testSlot1)
		at: (ASN1ObjectId fromString: '1.1') put: #ASN1BooleanType;
		at: (ASN1ObjectId fromString: '1.2') put: #ASN1IntegerType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.

	bytes := #(48 6 6 1 41 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = (ASN1ObjectId fromString: '1.1')).
	self assert: (obj testSlot2 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

	bytes := #(48 7 6 1 42 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = (ASN1ObjectId fromString: '1.2')).
	self assert: (obj testSlot2 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedAnyType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1AnyType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.

	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

	bytes := #(48 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedChoiceType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #TestChoice;
		yourself.
	((ASN1Module name: #test) choice: #TestChoice)
		add: #boolean type: #ASN1BooleanType;
		add: #integer type: #ASN1IntegerType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.

	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

	bytes := #(48 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedExplicitType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1IntegerType explicitTag: 0;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 6 160 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedImplicitConstructedType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1SequenceType implicitTag: 0;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 6 160 4 2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = (OrderedCollection with: 789)).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedImplicitPrimitiveType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1IntegerType implicitTag: 0;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 4 128 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - mapped' }
CryptoASN1Test >> testDefinedMappedBMPStringType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1BMPStringType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(30 11 104 101 108 108 111 32 119 111 114 108 100).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 'hello world').
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - mapped' }
CryptoASN1Test >> testDefinedMappedBooleanType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1BooleanType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - mapped' }
CryptoASN1Test >> testDefinedMappedIntegerType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1IntegerType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(2 2 3 21).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 789).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - mapped' }
CryptoASN1Test >> testDefinedMappedSequenceType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #TestSequence.
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1BooleanType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - mapped' }
CryptoASN1Test >> testDefinedMappedUTF8StringType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1StringType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(12 11 104 101 108 108 111 32 119 111 114 108 100).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 'hello world').
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSequenceOfType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) sequence: #TestSequence of: #ASN1BooleanType.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: OrderedCollection).
	self assert: (obj first = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSequenceType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1BooleanType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSequenceTypeDefault [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1BooleanType default: false;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 0).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = false).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSequenceTypeOptional [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		addOptional: #testSlot1 type: #ASN1BooleanType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 0).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSequenceTypeOptionalDefault [

	| bytes obj newBytes type |
	((ASN1Module name: #test) sequence: #TestSequence mapping: ASN1TestModel)
		addOptional: #testSlot1 type: #ASN1BooleanType default: false;
		yourself.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 0).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = false).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedSetType [

	| bytes obj newBytes type |
	((ASN1Module name: #test) set: #TestSet mapping: ASN1TestModel)
		add: #testSlot1 type: #ASN1BooleanType;
		yourself.

	type := (ASN1Module name: #test) find: #TestSet.
	bytes := #(49 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedUnmappedSequenceType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) sequence: #TestSequence.

	type := (ASN1Module name: #test) find: #TestSequence.
	bytes := #(48 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: OrderedCollection).
	self assert: (obj first = true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - defined types' }
CryptoASN1Test >> testDefinedUnmappedSetType [

	| bytes obj newBytes type |
	(ASN1Module name: #test) set: #TestSet.

	type := (ASN1Module name: #test) find: #TestSet.
	bytes := #(49 3 1 1 255).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: OrderedSet).
	self assert: (obj includes: true).
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testEqualsChecksType [

	self deny: (ASN1ObjectId fromString: '1.3.6.1.5.5.7.8.5') = Object new

]

{ #category : #'tests - base' }
CryptoASN1Test >> testIA5String [

	| bytes obj newBytes testObj |
	bytes := #(22 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - BER' }
CryptoASN1Test >> testIndefiniteLengthSequence [

	| bytes obj testObj |
	bytes := #(48 128 1 1 255 2 2 3 21 4 2 108 100 0 0).
	testObj := OrderedCollection new
		add: true;
		add: 789;
		add: #(108 100) asByteArray;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testInteger [

	| bytes obj newBytes testObj |
	bytes := #(2 2 3 21).
	testObj := 789.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testNull [

	| bytes obj newBytes |
	bytes := #(5 0).
	obj := ASN1Stream decodeBytes: bytes.
	self assert: obj isNil.
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testObjectIdentifier [

	| bytes obj newBytes testObj |
	bytes := #(6 8 43 6 1 5 5 7 8 5).
	testObj := ASN1ObjectId new
		oid: '1.3.6.1.5.5.7.8.5';
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testPrintableString [

	| bytes obj newBytes testObj |
	bytes := #(19 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testSequence [

	| bytes obj newBytes testObj |
	bytes := #(48 11 1 1 255 2 2 3 21 4 2 108 100).
	testObj := OrderedCollection new
		add: true;
		add: 789;
		add: #(108 100) asByteArray;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testSet [

	| bytes obj newBytes testObj |
	bytes := #(49 11 1 1 255 4 2 108 100 2 2 3 21 ).
	testObj := OrderedSet new
		add: true;
		add: #(108 100) asByteArray;
		add: 789;
		yourself.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testString [

	| bytes obj newBytes testObj |
	bytes := #(12 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testTeletexString [

	| bytes obj newBytes testObj |
	bytes := #(20 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testUTCTime [

	| bytes obj newBytes testObj |
	bytes := #(23 13 48 55 48 51 50 50 49 53 53 56 49 55 90).
	obj := ASN1Stream decodeBytes: bytes.
	testObj := DateAndTime fromString: '2007-03-22T15:58:17+00:00'.	
	self assert: obj rounded equals: testObj rounded.
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]

{ #category : #'tests - base' }
CryptoASN1Test >> testUniversalString [

	| bytes obj newBytes testObj |
	bytes := #(28 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).

]
