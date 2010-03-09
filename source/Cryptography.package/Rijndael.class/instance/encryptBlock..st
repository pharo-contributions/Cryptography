accessing
encryptBlock: aByteArray
	state := self stateFromBytes: aByteArray.
	self encryptState: state.
	self storeState: state into: aByteArray