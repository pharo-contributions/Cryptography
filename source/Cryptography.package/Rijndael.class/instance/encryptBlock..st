accessing
encryptBlock: aByteArray
	state _ self stateFromBytes: aByteArray.
	self encryptState: state.
	self storeState: state into: aByteArray