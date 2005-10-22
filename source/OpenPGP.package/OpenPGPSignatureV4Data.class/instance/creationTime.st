accessing
creationTime
	self subpackets: hashedSubpacketData do: [:data |
		data first = 2 ifTrue: [^data unsignedLongAt: 2 bigEndian: true]].
	^nil