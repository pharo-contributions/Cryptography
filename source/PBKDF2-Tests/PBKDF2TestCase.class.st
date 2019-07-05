Class {
	#name : #PBKDF2TestCase,
	#superclass : #TestCase,
	#category : 'PBKDF2-Tests'
}

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> assertDerivedKey: pbkdf2 iterations: iterations equals: aString [
	| expected |
	expected := ByteArray fromHexString: aString.
	self
		assert:
			(pbkdf2
				iterations: iterations;
				length: expected size;
				deriveKey)
		equals: expected
]

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> testRfc3962_0x1234567878563412 [
	| pbkdf2 |
	pbkdf2 := PBKDF2 new
		hashFunction: SHA1;
		password: 'password';
		salt: 16r1234567878563412;
		yourself.
	self
		assertDerivedKey: pbkdf2 iterations: 5 equals: 'd1 da a7 86 15 f2 87 e6 a1 c8 b1 20 d7 06 2a 49';
		assertDerivedKey: pbkdf2
			iterations: 5
			equals: 'd1 da a7 86 15 f2 87 e6 a1 c8 b1 20 d7 06 2a 49    3f 98 d2 03 e6 be 49 a6 ad f4 fa 57 4b 6e 64 ee'
]

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> testRfc3962_64X [
	| pbkdf2 |
	pbkdf2 := PBKDF2 new
		hashFunction: SHA1;
		password: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
		salt: 'pass phrase equals block size';
		yourself.
	self
		assertDerivedKey: pbkdf2 iterations: 1200 equals: '13 9c 30 c0 96 6b c3 2b a5 5f db f2 12 53 0a c9';
		assertDerivedKey: pbkdf2
			iterations: 1200
			equals: '13 9c 30 c0 96 6b c3 2b a5 5f db f2 12 53 0a c9     c5 ec 59 f1 a4 52 f5 cc 9a d9 40 fe a0 59 8e d1'
]

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> testRfc3962_65X [
	| pbkdf2 |
	pbkdf2 := PBKDF2 new
		hashFunction: SHA1;
		password: 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
		salt: 'pass phrase exceeds block size';
		yourself.
	self
		assertDerivedKey: pbkdf2 iterations: 1200 equals: '9c ca d6 d4 68 77 0c d5 1b 10 e6 a6 87 21 be 61';
		assertDerivedKey: pbkdf2
			iterations: 1200
			equals: '9c ca d6 d4 68 77 0c d5 1b 10 e6 a6 87 21 be 61    1a 8b 4d 28 26 01 db 3b 36 be 92 46 91 5e c8 2a'
]

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> testRfc3962_AthenaMitEduRaeburn [
	| pbkdf2 |
	pbkdf2 := PBKDF2 new
		hashFunction: SHA1;
		password: 'password';
		salt: 'ATHENA.MIT.EDUraeburn';
		yourself.
	self
		assertDerivedKey: pbkdf2 iterations: 1 equals: 'cd ed b5 28 1b b2 f8 01 56 5a 11 22 b2 56 35 15';
		assertDerivedKey: pbkdf2
			iterations: 1
			equals: 'cd ed b5 28 1b b2 f8 01 56 5a 11 22 b2 56 35 15    0a d1 f7 a0 4b b9 f3 a3 33 ec c0 e2 e1 f7 08 37'.
	self
		assertDerivedKey: pbkdf2 iterations: 2 equals: '01 db ee 7f 4a 9e 24 3e 98 8b 62 c7 3c da 93 5d';
		assertDerivedKey: pbkdf2
			iterations: 2
			equals: '01 db ee 7f 4a 9e 24 3e 98 8b 62 c7 3c da 93 5d    a0 53 78 b9 32 44 ec 8f 48 a9 9e 61 ad 79 9d 86'.
	self
		assertDerivedKey: pbkdf2 iterations: 1200 equals: '5c 08 eb 61 fd f7 1e 4e 4e c3 cf 6b a1 f5 51 2b';
		assertDerivedKey: pbkdf2
			iterations: 1200
			equals: '5c 08 eb 61 fd f7 1e 4e 4e c3 cf 6b a1 f5 51 2b    a7 e5 2d db c5 e5 14 2f 70 8a 31 e2 e6 2b 1e 13'
]

{ #category : #'as yet unclassified' }
PBKDF2TestCase >> testRfc3962_ExampleCOMpianist [
	| pbkdf2 |
	pbkdf2 := PBKDF2 new
		hashFunction: SHA1;
		password: 16rf09d849e;
		salt: 'EXAMPLE.COMpianist';
		yourself.
	self
		assertDerivedKey: pbkdf2 iterations: 50 equals: '6b 9c f2 6d 45 45 5a 43 a5 b8 bb 27 6a 40 3b 39';
		assertDerivedKey: pbkdf2
			iterations: 50
			equals: ' 6b 9c f2 6d 45 45 5a 43 a5 b8 bb 27 6a 40 3b 39     e7 fe 37 a0 c4 1e 02 c2 81 ff 30 69 e1 e9 4f 52'
]
