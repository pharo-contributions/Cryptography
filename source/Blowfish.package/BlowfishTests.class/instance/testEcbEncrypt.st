as yet unclassified
testEcbEncrypt
	|key cl enc res |
key:=ByteArray fromHexString:   'FFFFFFFFFFFFFFFF'.
cl := ByteArray fromHexString:  'FFFFFFFFFFFFFFFF'.
enc :=ByteArray fromHexString:  '51866FD5B85ECB8A' . 
res:=(Blowfish ecbEncrypt: cl with: key ) .

self assert: (res= enc).