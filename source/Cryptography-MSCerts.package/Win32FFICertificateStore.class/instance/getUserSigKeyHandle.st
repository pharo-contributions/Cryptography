primitives
getUserSigKeyHandle
	| result argPtr buffer ptr |
	"argPtr _ Win32LongBuffer new buffer: 0; yourSelf.
	argPtr setHandle: (ExternalAddress allocate: 4)."
	"buffer := ByteArray new: 4."
	buffer := ExternalData fromHandle: (ptr := ExternalAddress allocate: 4) type: ExternalType long.
	result := self class
			cryptGetUserKey: self selectedCertificate getHandle asInteger keyType: 2 handleBuffer: buffer getHandle asInteger.
	^ result
		ifTrue: [ptr]
		ifFalse: [ptr free. Transcript cr; show: 'method returned false'. 0]