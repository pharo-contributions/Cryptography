services
primitiveTypeFind: aSymbol

	^ (ASN1Type allSubclasses
		detect: [:class | class name asSymbol = aSymbol]
		ifNone: [^ nil]) new
