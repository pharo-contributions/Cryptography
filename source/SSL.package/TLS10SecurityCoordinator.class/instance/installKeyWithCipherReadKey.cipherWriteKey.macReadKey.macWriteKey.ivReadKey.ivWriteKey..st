secret
installKeyWithCipherReadKey: cipherReadKey cipherWriteKey: cipherWriteKey macReadKey: macReadKey macWriteKey: macWriteKey ivReadKey: ivReadKey ivWriteKey: ivWriteKey

	| readState writeState |
	readState := self protocolCap pendingReadState.
	readState macState readKey: macReadKey.
	readState cipherState readKey: cipherReadKey.
	readState cipherState ivReadKey: ivReadKey.

	writeState := self protocolCap pendingWriteState.
	writeState macState writeKey: macWriteKey.
	writeState cipherState writeKey: cipherWriteKey.
	writeState cipherState ivWriteKey: ivWriteKey.
