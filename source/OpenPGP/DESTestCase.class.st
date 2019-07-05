"
This class tests the DES algorithm using a test case defined by Ron Rivest in (http://theory.lcs.mit.edu/~rivest/destest.txt), which according to his analysis should uncover all possible single-point failures.
"
Class {
	#name : #DESTestCase,
	#superclass : #TestCase,
	#category : 'OpenPGP-Algorithms'
}

{ #category : #testing }
DESTestCase >> expectedFailures [ 
	"deactivating just. Not sure someone uses this code"
	^ #( testSSLeay testSSLeayWithBase )
]

{ #category : #running }
DESTestCase >> testRivest [
	"Run the simple test given by Ron Rivest in http://theory.lcs.mit.edu/~rivest/destest.txt"

	| des x |
	des := DESForOpenPGP new.
	x := 16r9474B8E8C73BCA7D.
	1 to: 16 do: [:i |
		des setKey: x.
		x := i odd
			ifTrue: [des encryptBlock: x]
			ifFalse: [des decryptBlock: x]].
	self assert: x = 16r1B1A2DDB4C642438
]

{ #category : #running }
DESTestCase >> testRivestWithBase [
	"Run the simple test given by Ron Rivest in http://theory.lcs.mit.edu/~rivest/destest.txt"

	| des x |
	des := DES new.
	x := 16r9474B8E8C73BCA7D asByteArray.
	1 to: 16 do: [:i |
		des key: x copy.
		i odd
			ifTrue: [des encryptBlock: x]
			ifFalse: [des decryptBlock: x]].
	self assert: x = 16r1B1A2DDB4C642438 asByteArray
]

{ #category : #running }
DESTestCase >> testSSLeay [
	"Run 3DES tests from the SSLeay package. Test vectors copied from OpenPGP source"
	| tripleDES |
	#(
		(	16r010101010101010101010101010101010101010101010101
			16r95F8A5E5DD31D900
			16r8000000000000000)
		(	16r010101010101010101010101010101010101010101010101
			16r9D64555A9A10B852
			16r0000001000000000)
		(	16r3849674C2602319E3849674C2602319E3849674C2602319E
			16r51454B582DDF440A
			16r7178876E01F19B2A)
		(	16r04B915BA43FEB5B604B915BA43FEB5B604B915BA43FEB5B6
			16r42FD443059577FA2
			16rAF37FB421F8C4095)
		(	16r0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF
			16r736F6D6564617461
			16r3D124FE2198BA318)
		(	16r0123456789ABCDEF55555555555555550123456789ABCDEF
			16r736F6D6564617461
			16rFBABA1FF9D05E9B1)
		(	16r0123456789ABCDEF5555555555555555FEDCBA9876543210
			16r736F6D6564617461
			16r18D748E563620572)
		(	16r0352020767208217860287665908219864056ABDFEA93457
			16r7371756967676C65
			16rC07D2A0FA566FA30)
		(	16r010101010101010180010101010101010101010101010102
			16r0000000000000000
			16rE6E6DD5B7E722974)
		(	16r10461034899880209107D0158919010119079210981A0101
			16r0000000000000000
			16rE1EF62C332FE825B)) do: [:array |
		tripleDES := TripleDESForOpenPGP new.
		tripleDES setKey: array first.
		self assert: (tripleDES encryptBlock: array second) = array third.
		self assert: (tripleDES decryptBlock: array third) = array second]
]

{ #category : #running }
DESTestCase >> testSSLeayWithBase [
	"Run 3DES tests from the SSLeay package. Test vectors copied from OpenPGP source"
	| tripleDES |
	#(
		(	16r010101010101010101010101010101010101010101010101
			16r95F8A5E5DD31D900
			16r8000000000000000)
		(	16r010101010101010101010101010101010101010101010101
			16r9D64555A9A10B852
			16r0000001000000000)
		(	16r3849674C2602319E3849674C2602319E3849674C2602319E
			16r51454B582DDF440A
			16r7178876E01F19B2A)
		(	16r04B915BA43FEB5B604B915BA43FEB5B604B915BA43FEB5B6
			16r42FD443059577FA2
			16rAF37FB421F8C4095)
		(	16r0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF
			16r736F6D6564617461
			16r3D124FE2198BA318)
		(	16r0123456789ABCDEF55555555555555550123456789ABCDEF
			16r736F6D6564617461
			16rFBABA1FF9D05E9B1)
		(	16r0123456789ABCDEF5555555555555555FEDCBA9876543210
			16r736F6D6564617461
			16r18D748E563620572)
		(	16r0352020767208217860287665908219864056ABDFEA93457
			16r7371756967676C65
			16rC07D2A0FA566FA30)
		(	16r010101010101010180010101010101010101010101010102
			16r0000000000000000
			16rE6E6DD5B7E722974)
		(	16r10461034899880209107D0158919010119079210981A0101
			16r0000000000000000
			16rE1EF62C332FE825B)) do: [:array |
		tripleDES := TripleDES new.
		tripleDES setKey: array first.
		self assert: (tripleDES encryptBlock: array second) = array third.
		self assert: (tripleDES decryptBlock: array third) = array second]
]
