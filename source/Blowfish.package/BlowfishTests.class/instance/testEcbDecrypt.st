as yet unclassified
testEcbDecrypt
	|key cl enc res |
key:=ByteArray fromHexString:   'FFFFFFFFFFFFFFFF'.
cl := ByteArray fromHexString:  'FFFFFFFFFFFFFFFF'.
enc :=ByteArray fromHexString:  '51866FD5B85ECB8A' . 
res:=(Blowfish ecbDecrypt: enc with: key ).
self assert: (res = cl).