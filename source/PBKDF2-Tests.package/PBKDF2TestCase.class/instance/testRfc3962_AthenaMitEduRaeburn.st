as yet unclassified
testRfc3962_AthenaMitEduRaeburn
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