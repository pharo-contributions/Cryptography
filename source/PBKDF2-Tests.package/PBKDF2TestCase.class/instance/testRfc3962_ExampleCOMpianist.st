as yet unclassified
testRfc3962_ExampleCOMpianist
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