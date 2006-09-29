primitives
privateKeyBlobSize
	| result argPtr |
	argPtr _ Win32LongBuffer new buffer: 0; yourSelf.
	result := self class
				cryptExportKey:  self selectedCertificate 
				exportKeyHandle: 0
				blobType: 7
				flags: 0
				blobData: nil
				blobLength: argPtr.
	
	^ result
		ifTrue: [argPtr]
		ifFalse: [argPtr free. Transcript cr; show: 'method returned false'. 0]