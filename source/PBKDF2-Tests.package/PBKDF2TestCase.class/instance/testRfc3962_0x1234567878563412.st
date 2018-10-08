as yet unclassified
testRfc3962_0x1234567878563412
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