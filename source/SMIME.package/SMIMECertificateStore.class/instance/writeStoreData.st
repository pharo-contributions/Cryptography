reading/writing
writeStoreData

	| refStream |
	refStream := ReferenceStream fileNamed: self certStoreFilename.
	refStream nextPut: self storeData.
	refStream close.

