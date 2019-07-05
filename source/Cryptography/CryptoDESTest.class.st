Class {
	#name : #CryptoDESTest,
	#superclass : #TestCase,
	#category : 'Cryptography-Tests'
}

{ #category : #'as yet unclassified' }
CryptoDESTest >> testDES [
	| plain key d |
	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.
	d := DES key: key.
	d encryptBlock: plain.
	self assert: plain = #(16rC9 16r57 16r44 16r25 16r6A 16r5E 16rD3 16r1D) asByteArray
]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testDES2 [
	| plain key d |
	plain := 'squeaker' asByteArray.
	key := 'hacking!' asByteArray.
	d := DES key: key.
	d encryptBlock: plain.
	self assert: plain = #[64 222 70 13 59 145 76 186]
]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testDES3 [
	| plain plainCopy key d |
	plain := 'squeaker'.
	key := 'hacking!'.
	plainCopy := plain copy.
	d := DES key: key.
	d encryptBlock: plainCopy.
	self assert: plainCopy asByteArray = #[64 222 70 13 59 145 76 186].

]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testDESCBC [
	| plain key encryptor decryptor vector |
	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.
	vector := #(16r00 16r11 16r22 16r33 16r44 16r55 16r66 16r77) asByteArray.
	encryptor := (DES key: key) cbc.
	encryptor initialVector: vector copy.
	decryptor := (DES key: key) cbc.
	decryptor initialVector: vector copy.
	encryptor encryptBlock: plain.
	decryptor decryptBlock: plain.
	encryptor encryptBlock: plain.
	decryptor decryptBlock: plain.
	self assert: plain = #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testDESFormal [
	| x d |
	x := #(16r94 16r74 16rB8 16rE8 16rC7 16r3B 16rCA 16r7D) asByteArray.
	1 to: 16 do: [:i |
		d := DES key: x.
		(i - 1) even 
			ifTrue: [d encryptBlock: x]
			ifFalse: [d decryptBlock: x] ].
	self assert: x = #(16r1B 16r1A 16r2D 16rDB 16r4C 16r64 16r24 16r38) asByteArray
]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testTripleDES [
	| plain key d |
	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.
	d := TripleDES key: key.
	d encryptBlock: plain.
	self assert: plain = #(16rC9 16r57 16r44 16r25 16r6A 16r5E 16rD3 16r1D) asByteArray.
	d decryptBlock: plain.
	self assert: plain = #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.

]

{ #category : #'as yet unclassified' }
CryptoDESTest >> testTripleDESCBC [
	| plain key encryptor decryptor vector |
	plain := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
	key := #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF 16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rEF) asByteArray.
	vector := #(16r00 16r11 16r22 16r33 16r44 16r55 16r66 16r77) asByteArray.
	encryptor := (TripleDES key: key) cbc.
	encryptor initialVector: vector copy.
	decryptor := (TripleDES key: key) cbc.
	decryptor initialVector: vector copy.
	encryptor encryptBlock: plain.
	decryptor decryptBlock: plain.
	encryptor encryptBlock: plain.
	decryptor decryptBlock: plain.
	self assert: plain = #(16r01 16r23 16r45 16r67 16r89 16rAB 16rCD 16rE7) asByteArray.
]
