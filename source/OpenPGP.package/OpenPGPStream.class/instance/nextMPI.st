accessing
nextMPI
	| bits |
	bits := stream next * 256 + stream next.
	^self nextNumber: bits+7//8