private
processBuffer: aByteArray
	"Process given 64-byte buffer, accumulating the results in totalA through totalE."

	| a b c d e w tmp |
	self primHasSecureHashPrimitive
		ifTrue: [^ self processBufferUsingPrimitives: aByteArray]
		ifFalse: [totals _ nil].

	"initialize registers a through e from the current totals" 
	a _ totalA copy.
	b _ totalB copy.
	c _ totalC copy.
	d _ totalD copy.
	e _ totalE copy.

	"expand and process the buffer"
	w _ self expandedBlock: aByteArray.
	1 to: 80 do: [:i |
		tmp _ (a copy leftRotateBy: 5)
			+= (self hashFunction: i of: b with: c with: d);
			+= e;
			+= (w at: i);
			+= (self constantForStep: i).
		e _ d.
		d _ c.
		c _ b copy leftRotateBy: 30.
		b _ a.
		a _ tmp].

	"add a through e into total accumulators"
	totalA += a.
	totalB += b.
	totalC += c.
	totalD += d.
	totalE += e.
