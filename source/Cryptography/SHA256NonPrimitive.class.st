"
SHA256 version without using a VM plugin
"
Class {
	#name : #SHA256NonPrimitive,
	#superclass : #SHA256,
	#category : #'Cryptography-SHA256'
}

{ #category : #constants }
SHA256NonPrimitive class >> h0 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r6A09E667
]

{ #category : #constants }
SHA256NonPrimitive class >> h1 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16rBB67AE85
]

{ #category : #constants }
SHA256NonPrimitive class >> h2 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r3C6EF372
]

{ #category : #constants }
SHA256NonPrimitive class >> h3 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16rA54FF53A
]

{ #category : #constants }
SHA256NonPrimitive class >> h4 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r510E527F
]

{ #category : #constants }
SHA256NonPrimitive class >> h5 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r9B05688C
]

{ #category : #constants }
SHA256NonPrimitive class >> h6 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r1F83D9AB
]

{ #category : #constants }
SHA256NonPrimitive class >> h7 [
	"2 raisedTo: 32 times the square root of the first 8 primes 2..19"
	"#(2 3 5 7 11 13 17 19) collect: [:x | ((x sqrt) * (2.0 raisedTo: 32)) truncated hex] // 32 bits"
	^16r5BE0CD19
]

{ #category : #constants }
SHA256NonPrimitive class >> roundConstants [
	"2 raisedTo: 32 times the cube root of the first 64 primes 2..311"
	"(Integer primesUpTo: 311) collect: [:x | ((x raisedTo: 1/3) * (2.0 raisedTo: 32)) truncated hex] \\ 32 bits" 
	^#(16r428A2F98 16r71374491 16rB5C0FBCF 16rE9B5DBA5 16r3956C25B 16r59F111F1 16r923F82A4 16rAB1C5ED5 16rD807AA98 16r12835B01 16r243185BE 16r550C7DC3 16r72BE5D74 16r80DEB1FE 16r9BDC06A7 16rC19BF174 16rE49B69C1 16rEFBE4786 16r0FC19DC6 16r240CA1CC 16r2DE92C6F 16r4A7484AA 16r5CB0A9DC 16r76F988DA 16r983E5152 16rA831C66D 16rB00327C8 16rBF597FC7 16rC6E00BF3 16rD5A79147 16r06CA6351 16r14292967 16r27B70A85 16r2E1B2138 16r4D2C6DFC 16r53380D13 16r650A7354 16r766A0ABB 16r81C2C92E 16r92722C85 16rA2BFE8A1 16rA81A664B 16rC24B8B70 16rC76C51A3 16rD192E819 16rD6990624 16rF40E3585 16r106AA070 16r19A4C116 16r1E376C08 16r2748774C 16r34B0BCB5 16r391C0CB3 16r4ED8AA4A 16r5B9CCA4F 16r682E6FF3 16r748F82EE 16r78A5636F 16r84C87814 16r8CC70208 16r90BEFFFA 16rA4506CEB 16rBEF9A3F7 16rC67178F2)
	
]

{ #category : #private }
SHA256NonPrimitive >> expandedBlock: aByteArray [
	"Convert the given 64 byte buffer into 64 32-bit registers and answer the result." 
	| out src |
	out := Array new: 64.
	src := 1.
	1 to: 16 do: [:i |
		out at: i put: (ThirtyTwoBitRegister new loadFrom: aByteArray at: src).
		src := src + 4].

	17 to: 64 do: [:i | | s0 s1 wi15 wi2 wi |
		wi15 := (out at: i - 15) copy.
		wi2 := (out at: i-2) copy.
		s0 := wi15 copy.
		s0 leftRotateBy: -7;
			bitXor: (wi15 copy leftRotateBy: -18);
			bitXor: (wi15 copy bitShift: -3).
		s1 := wi2 copy.
		s1 leftRotateBy: -17;
			bitXor: (wi2 copy leftRotateBy: -19);
			bitXor: (wi2 copy bitShift: -10).
		wi := (out at: i-16) copy += s0 += (out at: i-7) copy += s1.
		out at: i put: wi].
	^ out

]

{ #category : #accessing }
SHA256NonPrimitive >> finalHash [
	"Concatenate the final totals to build the 256-bit integer result."

	^ ((totalA asInteger bitShift: 224) +
	  (totalB asInteger bitShift: 192) +
	  (totalC asInteger bitShift: 160) +	
	  (totalD asInteger bitShift: 128) +
	  (totalE asInteger bitShift:  96) +
	  (totalF asInteger bitShift:  64) +
	  (totalG asInteger bitShift:  32) +
	  (totalH asInteger)) asByteArrayOfSize: 32.
]

{ #category : #private }
SHA256NonPrimitive >> initialize [
	"Initialize totalA through totalH to their seed values."

	super initialize.
	totalA := ThirtyTwoBitRegister new load: self class h0.
	totalB := ThirtyTwoBitRegister new load: self class h1.
	totalC := ThirtyTwoBitRegister new load: self class h2.
	totalD := ThirtyTwoBitRegister new load: self class h3.
	totalE := ThirtyTwoBitRegister new load: self class h4.
	totalF := ThirtyTwoBitRegister new load: self class h5.
	totalG := ThirtyTwoBitRegister new load: self class h6.
	totalH := ThirtyTwoBitRegister new load: self class h7

]

{ #category : #private }
SHA256NonPrimitive >> processBuffer: aByteArray [
	"Process the given 64-byte buffer, accumulating the results in totalA through totalH."

	| a b c d e f g h w |
	"initialize registers a through h from the current totals" 
	a := totalA copy.
	b := totalB copy.
	c := totalC copy.
	d := totalD copy.
	e := totalE copy.
	f := totalF copy.
	g := totalG copy.
	h := totalH copy.

	"expand and process the buffer"
	w := self expandedBlock: aByteArray.
	1 to: 64 do: [:i | | s0 maj t0 s1 ch t1 |
		s0 := (a copy leftRotateBy: -2).
		s0 bitXor: (a copy leftRotateBy: -13);
			bitXor: (a copy leftRotateBy: -22).
		maj := (a copy bitAnd: b).
		maj bitOr: (b copy bitAnd: c);
			bitOr: (c copy bitAnd: a).
		t0 := s0 copy += maj.
		s1 := (e copy leftRotateBy: -6).
		s1 bitXor: (e copy leftRotateBy: -11);
			bitXor: (e copy leftRotateBy: -25).
		ch := (e copy bitAnd: f).
		ch bitOr: ((e copy bitInvert) bitAnd: g).
		t1 := h copy += s1 += ch += (ThirtyTwoBitRegister new load: (self class roundConstants at: i)) += (w at: i) copy.
		h := g.
		g := f.
		f := e.
		e := d copy += t1.
		d := c.
		c := b.
		b := a.
		a := t0 += t1.
	"Transcript cr; show: i asString, String tab, a asString, String tab, b asString, String tab, c asString, String tab, d asString, String tab, e asString, String tab, f asString, String tab, g asString, String tab, h asString, String tab."
	].

	"add a through h into total accumulators"
	totalA += a.
	totalB += b.
	totalC += c.
	totalD += d.
	totalE += e.
	totalF += f.
	totalG += g.
	totalH += h
]
