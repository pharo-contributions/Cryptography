constants
descriptionFromCode: code

	| codeDict |
	codeDict := Dictionary new
		at: 0 put: 'close notify';
		at: 10 put: 'unexpected message';
		at: 20 put: 'bad record mac';
		at: 21 put: 'decryption failed';
		at: 22 put: 'record overflow';
		at: 30 put: 'decompression failure';
		at: 40 put: 'handshake failure';
		at: 41 put: 'no certificate RESERVED';
		at: 42 put: 'bad certificate';
		at: 43 put: 'unsupported certificate';
		at: 44 put: 'certificate revoked';
		at: 45 put: 'certificate expired';
		at: 46 put: 'certificate unknown';
		at: 47 put: 'illegal parameter';
		at: 48 put: 'unknown CA';
		at: 49 put: 'access denied';
		at: 50 put: 'decode error';
		at: 51 put: 'decrypt error';
		at: 60 put: 'export restriction RESERVED';
		at: 70 put: 'protocol version';
		at: 71 put: 'insufficient security';
		at: 80 put: 'internal error';
		at: 90 put: 'user cancelled';
		at: 100 put: 'no renegotiation';
		yourself.
	^ codeDict at: code ifAbsent: ['unknown error']