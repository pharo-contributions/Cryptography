*cryptography-core
asInteger
	^ self inject: 0 into: [ :sum :each | sum * 256 + each]