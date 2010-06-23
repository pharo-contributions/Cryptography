accessing
decryptBlock: aByteArray
	state _ self stateFromBytes: aByteArray.
	self decryptState: state.
	self storeState: state into: aByteArray