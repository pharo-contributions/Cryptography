primitives
primitiveProcessBuffer: x withState: h

	self primitive: 'primitiveProcessBufferWithState' parameters: #(ByteArray ByteArray).
	self processBuffer: x withState: h.
