as yet unclassified
testRfc3962_65X
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