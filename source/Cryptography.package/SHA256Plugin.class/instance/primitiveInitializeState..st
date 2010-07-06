primitives
primitiveInitializeState: state

	self primitive: 'primitiveInitializeState' parameters: #(ByteArray).
	self initializeState: (self cCoerce: state to: #'unsigned int*')
