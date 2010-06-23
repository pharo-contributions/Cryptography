support
processKey: keyPtr mode: encode to: cookedPtr
	| l m n pc1m pcr rawKey |
	self var: 'cookedPtr' declareC: 'unsigned long *cookedPtr'.
	self var: 'keyPtr' declareC: 'unsigned char *keyPtr'.
	self var: 'pc1m' declareC: 'unsigned char pc1m[56]'.
	self var: 'pcr' declareC: 'unsigned char pcr[56]'.
	self var: 'rawKey' declareC: 'unsigned long rawKey[32]'.
	self cCode: '/* Who is Keyser Soze? */' inSmalltalk: [pcr _ 1. pc1m
_ 1. rawKey _ 1].
	0 to: 55 do: [ :j |
		l _ pc1 at: j.
		m _ l bitAnd: 7.
		((((keyPtr at: (l >> 3)) bitAnd: (byteBit at: m))) ~= 0)
			ifTrue: [ pc1m at: j put: 1 ]
			ifFalse: [ pc1m at: j put: 0].
		].
	0 to: 15 do: [ :i |
		encode ifFalse: [ m _ 15 - i << 1] ifTrue: [m _ i << 1].
		n _ m + 1.
		rawKey at: m put: (rawKey at: n put: 0).
		0 to: 27 do: [ :j |
			l _ j + (totRot at: i).
			l<28 ifTrue: [pcr at: j put: (pc1m at: l)] ifFalse:
[pcr at: j put: (pc1m at: l-28)].
			].
		28 to: 55 do: [ :j |
			l _ j + (totRot at: i).
			l<56 ifTrue: [pcr at: j put: (pc1m at: l)] ifFalse:
[pcr at: j put: (pc1m at: l-28)].
			].
		0 to: 23 do: [ :j |
			(pcr at: (pc2 at: j)) ~= 0 ifTrue:
				[rawKey at: m put: ((rawKey at: m) bitOr:
(bigByte at: j))].
			(pcr at: (pc2 at: j+24)) ~= 0 ifTrue:
				[rawKey at: n put: ((rawKey at: n) bitOr:
(bigByte at: j))].
			].
		].
	self cookKey: rawKey to: cookedPtr