initialize-release
setKeyFromByteArray: aByteArray
	self setKey: ((aByteArray unsignedLongAt: 1 bigEndian: true) bitShift: 32) + (aByteArray unsignedLongAt: 5 bigEndian: true)