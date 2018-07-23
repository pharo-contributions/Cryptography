accessing
deriveKey
	| l |
	dkLen > (((2 raisedTo: 32) - 1) * hLen)
		ifTrue: [ self error: 'derived key too long' ].	"If dkLen > (2^32 - 1) * hLen, output 'derived key too long' and
         stop."
	l := (dkLen / hLen) ceiling.	"Let l be the number of hLen-octet blocks in the derived key,
         rounding up"	"r := dkLen - ((l - 1) * hLen)."	"and let r be the number of octets in the last
         block:"
	^ (ByteArray streamContents: [ :dkStream | 1 to: l do: [ :i | dkStream nextPutAll: (self deriveBlock: i) ] ]) contents
		copyFrom: 1
		to: dkLen