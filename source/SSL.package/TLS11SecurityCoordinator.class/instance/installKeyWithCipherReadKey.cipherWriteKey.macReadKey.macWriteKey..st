secret
installKeyWithCipherReadKey: cipherReadKey cipherWriteKey: cipherWriteKey macReadKey: macReadKey macWriteKey: macWriteKey

	| readState writeState |
	readState := self protocolCap pendingReadState.
	readState macState readKey: macReadKey.
	readState cipherState readKey: cipherReadKey.

	writeState := self protocolCap pendingWriteState.
	writeState macState writeKey: macWriteKey.
	writeState cipherState writeKey: cipherWriteKey.
