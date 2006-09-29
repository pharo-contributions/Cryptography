*Cryptography-MSCerts
asMSWideString
	self isMSWideString ifTrue: [^self].
	^MSWideString from: self.