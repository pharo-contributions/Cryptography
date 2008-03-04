primitives-SHA
primitiveHashBlock
	"Hash a Bitmap of 80 32-bit words (the first argument), using the given state (the second argument)."

	| state buf statePtr bufPtr a b c d e tmp |
	self export: true.
	self var: #statePtr declareC: 'unsigned int *statePtr'.
	self var: #bufPtr declareC: 'unsigned int *bufPtr'.

	state _ interpreterProxy stackObjectValue: 0.
	buf _ interpreterProxy stackObjectValue: 1.
	interpreterProxy success: (interpreterProxy isWords: state).
	interpreterProxy success: (interpreterProxy isWords: buf).
	interpreterProxy failed ifTrue: [^ nil].

	interpreterProxy success: ((interpreterProxy stSizeOf: state) = 5).
	interpreterProxy success: ((interpreterProxy stSizeOf: buf) = 80).
	interpreterProxy failed ifTrue: [^ nil].

	statePtr _ interpreterProxy firstIndexableField: state.
	bufPtr _ interpreterProxy firstIndexableField: buf.

	a _ statePtr at: 0.
	b _ statePtr at: 1.
	c _ statePtr at: 2.
	d _ statePtr at: 3.
	e _ statePtr at: 4.
 
	0 to: 19 do: [:i |
		tmp _ 16r5A827999 + ((b bitAnd: c) bitOr: (b bitInvert32 bitAnd: d)) +
				(self leftRotate: a by: 5) +  e + (bufPtr at: i).
		e _ d.  d _ c.  c _ self leftRotate: b by: 30.  b _ a.  a _ tmp].

	20 to: 39 do: [:i |
		tmp _ 16r6ED9EBA1 + ((b bitXor: c) bitXor: d) +
				(self leftRotate: a by: 5) +  e + (bufPtr at: i).
		e _ d.  d _ c.  c _ self leftRotate: b by: 30.  b _ a.  a _ tmp].

	40 to: 59 do: [:i |
		tmp _ 16r8F1BBCDC + (((b bitAnd: c) bitOr: (b bitAnd: d)) bitOr: (c bitAnd: d)) +
				(self leftRotate: a by: 5) +  e + (bufPtr at: i).
		e _ d.  d _ c.  c _ self leftRotate: b by: 30.  b _ a.  a _ tmp].

	60 to: 79 do: [:i |
		tmp _ 16rCA62C1D6 + ((b bitXor: c) bitXor: d) +
				(self leftRotate: a by: 5) +  e + (bufPtr at: i).
		e _ d.  d _ c.  c _ self leftRotate: b by: 30.  b _ a.  a _ tmp].

	statePtr at: 0 put: (statePtr at: 0) + a.
	statePtr at: 1 put: (statePtr at: 1) + b.
	statePtr at: 2 put: (statePtr at: 2) + c.
	statePtr at: 3 put: (statePtr at: 3) + d.
	statePtr at: 4 put: (statePtr at: 4) + e.

	interpreterProxy pop: 2.
