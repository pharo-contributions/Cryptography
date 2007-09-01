key derivation
installKeysIntoState

	self isClient
		ifTrue: [
			self pendingWriteState cipherState 
				ivWriteKey: (self deriveKeyWithParameter: $A size: self pendingWriteState cipherState ivSize).
			self pendingWriteState cipherState 
				writeKey: (self deriveKeyWithParameter: $C size: self pendingWriteState cipherState keySize).
			self pendingWriteState macState 
				writeKey: (self deriveKeyWithParameter: $E size: self pendingWriteState macState keySize).
			self pendingReadState cipherState 
				ivReadKey: (self deriveKeyWithParameter: $B size: self pendingReadState cipherState ivSize).
			self pendingReadState cipherState 
				readKey: (self deriveKeyWithParameter: $D size: self pendingReadState cipherState keySize).
			self pendingReadState macState 
				readKey: (self deriveKeyWithParameter: $F size: self pendingReadState macState keySize)]
		ifFalse: [
			self pendingWriteState cipherState 
				ivWriteKey: (self deriveKeyWithParameter: $B size: self pendingWriteState cipherState ivSize).
			self pendingWriteState cipherState 
				writeKey: (self deriveKeyWithParameter: $D size: self pendingWriteState cipherState keySize).
			self pendingWriteState macState 
				writeKey: (self deriveKeyWithParameter: $F size: self pendingWriteState macState keySize).
			self pendingReadState cipherState 
				ivReadKey: (self deriveKeyWithParameter: $A size: self pendingReadState cipherState ivSize).
			self pendingReadState cipherState 
				readKey: (self deriveKeyWithParameter: $C size: self pendingReadState cipherState keySize).
			self pendingReadState macState 
				readKey: (self deriveKeyWithParameter: $E size: self pendingReadState macState keySize)].
