accessing
add: aPacket
	ownedPackets isNil ifFalse: [
		(self ownedPackets last add: aPacket)
			ifTrue: [^true]].
	(aPacket canBeAddedTo: self) ifFalse: [^false].
	ownedPackets := ownedPackets isNil
		ifTrue: [Array with: aPacket]
		ifFalse: [ownedPackets copyWith: aPacket].
	aPacket owner: self.
	^true