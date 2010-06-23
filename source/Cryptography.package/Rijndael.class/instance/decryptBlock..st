accessing
decryptBlock: aByteArray
	state := self stateFromBytes: aByteArray.
	self decryptState: state.
	self storeState: state into: aByteArray