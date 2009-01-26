support
encrypt: dataPtr with: key
	| fVal work right left |
	self var: 'dataPtr' declareC: 'unsigned long *dataPtr'.
	self var: 'key' declareC: 'unsigned long *key'.
	self var: 'fVal' declareC: 'unsigned long fVal'.
	self var: 'work' declareC: 'unsigned long work'.
	self var: 'right' declareC: 'unsigned long right'.
	self var: 'left' declareC: 'unsigned long left'.

	left _ dataPtr at: 0.
	right _ dataPtr at: 1.

	"perform required but otherwise pointless bit twizzling"
	work _ ((left >> 4) bitXor: right) bitAnd: 16r0F0F0F0F.
	right _ right bitXor: work.
	left _ left bitXor: (work << 4).
	work _ ((left >> 16) bitXor: right) bitAnd: 16r0000FFFF.
	right _ right bitXor: work.
	left _ left bitXor: (work << 16).
	work _ ((right >> 2) bitXor: left) bitAnd: 16r33333333.
	left _ left bitXor: work.
	right _ right bitXor: (work << 2).
	work _ ((right >> 8) bitXor: left) bitAnd: 16r00FF00FF.
	left _ left bitXor: work.
	right _ right bitXor: (work << 8).
	right _ ((right << 1) bitOr: ((right >> 31) bitAnd: 1)) bitAnd: 16rFFFFFFFF.
	work _ (left bitXor: right) bitAnd: 16rAAAAAAAA.
	left _ left bitXor: work.
	right _ right bitXor: work.
	left _ ((left << 1) bitOr: ((left >> 31) bitAnd: 1)) bitAnd:
16rFFFFFFFF.

	"perform the 8 rounds of real encryption"
	0 to: 28 by: 4 do: [ :round |
		work _ right << 28 bitOr: right >> 4.
		work _ work bitXor: (key at: round).
		fVal _ sp7 at: (work bitAnd: 16r3F).
		fVal _ fVal bitOr: (sp5 at: (work >> 8 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp3 at: (work >> 16 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp1 at: (work >> 24 bitAnd: 16r3F)).

		work _ right bitXor: (key at: round+1).
		fVal _ fVal bitOr: (sp8 at: (work bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp6 at: (work >> 8 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp4 at: (work >> 16 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp2 at: (work >> 24 bitAnd: 16r3F)).
		left _ left bitXor: fVal.

		work _ left << 28 bitOr: left >> 4.
		work _ work bitXor: (key at: round+2).
		fVal _ sp7 at: (work bitAnd: 16r3F).
		fVal _ fVal bitOr: (sp5 at: (work >> 8 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp3 at: (work >> 16 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp1 at: (work >> 24 bitAnd: 16r3F)).

		work _ left bitXor: (key at: round+3).
		fVal _ fVal bitOr: (sp8 at: (work bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp6 at: (work >> 8 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp4 at: (work >> 16 bitAnd: 16r3F)).
		fVal _ fVal bitOr: (sp2 at: (work >> 24 bitAnd: 16r3F)).
		right _ right bitXor: fVal.
		].

	"undo the pointless twizzling"
	right _ right<<31 bitOr: right>>1.
	work _ (left bitXor: right) bitAnd: 16rAAAAAAAA.
	left _ left bitXor: work.
	right _ right bitXor: work.
	left _ left<<31 bitOr: left>>1.
	work _ (left>>8 bitXor: right) bitAnd: 16r00FF00FF.
	right _ right bitXor: work.
	left _ left bitXor: work<<8.
	work _ (left >> 2 bitXor: right) bitAnd: 16r33333333.
	right _ right bitXor: work.
	left _ left bitXor: work<<2.
	work _ (right>>16 bitXor: left) bitAnd: 16r0000FFFF.
	left _ left bitXor: work.
	right _ right bitXor: work<<16.
	work _(right>>4 bitXor: left) bitAnd: 16r0F0F0F0F.
	left _ left bitXor: work.
	right _ right bitXor: work<<4.

	dataPtr at: 0 put: right.
	dataPtr at: 1 put: left.

	