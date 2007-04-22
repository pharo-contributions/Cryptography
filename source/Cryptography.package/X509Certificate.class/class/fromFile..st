instance creation
fromFile: filename

	| fs data i j |
	fs := StandardFileStream readOnlyFileNamed: filename.
	data := fs contentsOfEntireFile.
	i := data indexOfSubCollection: '--BEGIN ' startingAt: 1.
	i = 0 ifTrue: [^ self fromBytes: data asByteArray].
	i := data indexOfSubCollection: 'CERTIFICATE--' startingAt: i.
	j := data indexOfSubCollection: '--END ' startingAt: i.
	i := data findAnySubStr: String crlf startingAt: i.
	data := (data copyFrom: i to: j)
		reject: [:c | (c = $-) or: [c isSeparator]].
	data := (Base64MimeConverter mimeDecodeToBytes: data readStream) contents.
	^ self fromBytes: data.
