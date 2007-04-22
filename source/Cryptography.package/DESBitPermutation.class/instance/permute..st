permuting
permute: input
	| output shift bits |
	output := 0.
	shift := 0.
	tables do: [:array |
		bits := (input bitShift: shift) bitAnd: ChunkMask.
		output := output + (array at: bits+1).
		shift := shift - ChunkBits].
	^output