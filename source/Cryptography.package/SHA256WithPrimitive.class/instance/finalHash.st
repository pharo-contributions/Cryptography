private
finalHash

	| hash |
	hash := ByteArray new: state size.
	self primFinalHash: hash fromState: state.
	^hash