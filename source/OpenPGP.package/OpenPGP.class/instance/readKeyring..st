private
readKeyring: aFilename
	| in |
	in := OpenPGPStream onStream: (FileStream readOnlyFileNamed: aFilename).
	^[OpenPGPKeyring new readFrom: in] ensure: [in close]
