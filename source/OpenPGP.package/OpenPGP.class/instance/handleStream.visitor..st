private
handleStream: aStream visitor: aVisitor
	| str packet |
	aVisitor config: self.
	str := OpenPGPStream onStream: aStream.
	[str atEnd] whileFalse: [
		packet := str nextPacket.
		packet acceptVisitor: aVisitor].
	aVisitor finish