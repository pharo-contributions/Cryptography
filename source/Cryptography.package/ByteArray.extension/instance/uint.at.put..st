*cryptography-core
uint: bits at: position put: anInteger

	position
		to: position + (bits // 8) - 1
		do:
			[ :pos |
			self
				at: pos
				put: (anInteger digitAt: pos-position+1) ].
	^ anInteger