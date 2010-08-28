canned protocols
localEcho
	"A reflect suitable for local echo on dumb ttys, when placed immediately below a TtyMorph, recognising a few of the ASCII control characters."

	| c |
	^self
		upBlock: [:arg | down downcall: arg];
		downBlock: [:arg | c := arg bitAnd: 127.
			(c == 8) | (c == 127) ifTrue: [up bs; upcall: 32; bs]
				ifFalse: [(c == 10) | (c == 13) ifTrue: [up newline]
				ifFalse: [c >= 32 ifTrue: [up upcall: c]]].
			up flush.]