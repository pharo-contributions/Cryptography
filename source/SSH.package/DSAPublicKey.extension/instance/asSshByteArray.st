*ssh
asSshByteArray

	| msg stream |
	msg := SSHBinaryMessage new.
	stream := '' asByteArray writeStream.
	stream nextPutAll: (7 asByteArrayOfSize: 4).
	stream nextPutAll: 'ssh-dss' asByteArray.
	stream nextPutAll: (msg mpintOn: p).
	stream nextPutAll: (msg mpintOn: q).
	stream nextPutAll: (msg mpintOn: g).
	stream nextPutAll: (msg mpintOn: y).
	^ stream contents 