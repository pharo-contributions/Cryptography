as yet unclassified
testRfc3962_64X
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