*smime
asHeaderValue
	| strm |
	strm _ WriteStream on: (String new: 20).
	strm nextPutAll: mainValue.
	parameters associationsDo: [:e | 
		strm nextPut: $; ;
		cr; tab; 
		nextPutAll: e key;
		nextPutAll: '="';
		nextPutAll: e value;
		nextPut: $"].
	^ strm contents