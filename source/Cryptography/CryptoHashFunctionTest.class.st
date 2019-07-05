Class {
	#name : #CryptoHashFunctionTest,
	#superclass : #TestCase,
	#category : 'Cryptography-Tests'
}

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testHMAC [
	self assert: (MD5 new hmac key: (ByteArray new: 16 withAll: 16r0B); digestMessage: 'Hi There' asByteArray) asInteger = 16r9294727A3638BB1C13F48EF8158BFC9D.
	self assert: (MD5 new hmac key: 'Jefe' asByteArray; digestMessage: 'what do ya want for nothing?' asByteArray) asInteger = 16r750C783E6AB0B503EAA86E310A5DB738.
	self assert: (MD5 new hmac key: (ByteArray new: 16 withAll: 16rAA); digestMessage: (ByteArray new: 50 withAll: 16rDD)) asInteger = 16r56BE34521D144C88DBB8C733F0E8B3F6
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testHMACSHA1 [
	self assert: ((SHA1 new hmac key: (ByteArray new: 16 withAll: 16r0B); digestMessage: 'Hi There' asByteArray) asByteArray) = #(16r67 16r5B 16rB 16r3A 16r1B 16r4D 16rDF 16r4E 16r12 16r48 16r72 16rDA 16r6C 16r2F 16r63 16r2B 16rFE 16rD9 16r57 16rE9) asByteArray
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testLargeSHA1 [
	"Here is the third example from the specification document (FIPS PUB 180-1). This example may take several minutes."
	self assert: (SHA1 hashMessage: (String new: 1000000 withAll: $a)) asInteger = 16r34AA973CD4C4DAA4F61EEB2BDBAD27316534016F
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testMD2 [
	self assert: (MD2 hashMessage: '') asInteger = 16r8350E5A3E24C153DF2275C9F80692773.
	self assert: (MD2 hashMessage: 'a') asInteger = 16r32EC01EC4A6DAC72C0AB96FB34C0B5D1.
	self assert: (MD2 hashMessage: 'abc') asInteger = 16rDA853B0D3F88D99B30283A69E6DED6BB.
	self assert: (MD2 hashMessage: 'message digest') asInteger = 16rAB4F496BFB2A530B219FF33031FE06B0.
	self assert: (MD2 hashMessage: 'abcdefghijklmnopqrstuvwxyz') asInteger  = 16r4E8DDFF3650292AB5A4108C3AA47940B.
	self assert: (MD2 hashMessage: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') asInteger = 16rDA33DEF2A42DF13975352846C30338CD.
	self assert: (MD2 hashMessage: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') asInteger = 16rD5976F79D83D3A0DC9806C3C66F3EFD8.
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testMD4 [
	self assert: (MD4 hashMessage: #(115 0 115 0 110 0) asByteArray) = #(252 63 129 51 180 217 221 240 64 37 167 140 183 214 26 126) asByteArray
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testMD5 [

	self assert: (MD5 hashMessage: '') asInteger = 16rD41D8CD98F00B204E9800998ECF8427E.
	self assert: (MD5 hashMessage: 'a') asInteger = 16r0CC175B9C0F1B6A831C399E269772661.
	self assert: (MD5 hashMessage: 'abc') asInteger = 16r900150983CD24FB0D6963F7D28E17F72.
	self assert: (MD5 hashMessage: 'message digest') asInteger = 16rF96B697D7CB7938D525A2F31AAF161D0.
	self assert: (MD5 hashMessage: 'abcdefghijklmnopqrstuvwxyz') asInteger = 16rC3FCD3D76192E4007DFB496CCA67E13B.
	self assert: (MD5 hashMessage: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') asInteger = 16rD174AB98D277D9F5A5611C2C9F419D9F.
	self assert: (MD5 hashMessage: '12345678901234567890123456789012345678901234567890123456789012345678901234567890') asInteger = 16r57EDF4A22BE3C955AC49DA2E2107B67A
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testMD5Implementations [
	"Check if the two implementations give the same results. Do nothing if the plugin is not available"

	| data |
	MD5 isPluginAvailable ifFalse: [ ^self ].
	data := ''.
	100 timesRepeat: [ 
		| primitive nonPrimitive |
		primitive := MD5NonPrimitive basicNew hashMessage: data.
		nonPrimitive := MD5WithPrimitive basicNew hashMessage: data.
		self assert: primitive = nonPrimitive.
		data := data, 'Squeak' ]
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testSHA1 [
	self assert: (SHA1 hashMessage: 'abc') asInteger = 16rA9993E364706816ABA3E25717850C26C9CD0D89D.
	self assert: (SHA1 hashMessage: 'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq') asInteger = 16r84983E441C3BD26EBAAE4AA1F95129E5E54670F1

]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testSHA256 [
	"these tests come from http://csrc.nist.gov/publications/fips/fips180-2/fips180-2withchangenotice.pdf"

	self assert: (SHA256 hashMessage: 'abc') asInteger = 16rBA7816BF8F01CFEA414140DE5DAE2223B00361A396177A9CB410FF61F20015AD.
	self assert: (SHA256 hashMessage:  'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq') asInteger = 16r248D6A61D20638B8E5C026930C3E6039A33CE45964FF2167F6ECEDD419DB06C1.
	SHA256 isPluginAvailable ifTrue: [ "takes a while to run without the plugin"
		self assert: (SHA256 hashMessage: (String new: 1000000 withAll: $a)) asInteger = 16rCDC76E5C9914FB9281A1C7E284D73E67F1809A48A497200E046D39CCC7112CD0 ]
]

{ #category : #'hash algorithms' }
CryptoHashFunctionTest >> testSHA256Implementations [
	"Check if the two implementations give the same results. Do nothing if the plugin is not available"

	| data |
	SHA256 isPluginAvailable ifFalse: [ ^self ].
	data := ''.
	100 timesRepeat: [ 
		| primitive nonPrimitive |
		primitive := SHA256NonPrimitive basicNew hashMessage: data.
		nonPrimitive := SHA256WithPrimitive basicNew hashMessage: data.
		self assert: primitive = nonPrimitive.
		data := data, 'Squeak' ]
]
