get the page
expandUrl: newUrl ip: byteArrayIP port: portNum

	(newUrl beginsWith: '../') 
		ifTrue: [
			^ String streamContents: [:strm | 
				byteArrayIP do: [:bb | bb printOn: strm.  strm nextPut: $.].
				strm skip: -1; nextPut: $:.
				portNum printOn: strm.
				strm nextPutAll: (newUrl allButFirst: 2)]].
	(newUrl beginsWith: '/') 
		ifTrue: [
			^ String streamContents: [:strm | 
				byteArrayIP do: [:bb | bb printOn: strm.  strm nextPut: $.].
				strm skip: -1; nextPut: $:.
				portNum printOn: strm.
				strm nextPutAll: newUrl]].
	^ newUrl
