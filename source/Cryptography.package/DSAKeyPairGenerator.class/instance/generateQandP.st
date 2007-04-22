as yet unclassified
generateQandP
	"Generate the two industrial-grade primes, q (160-bits) and p (512-bit) needed to build a key set. Answer the array (q, p, s), where s is the seed that from which q and p were created. This seed is normally discarded, but can be used to verify the key generation process if desired."

	| pBits halfTwoToTheP chunkCount twoQ n c w |
	pBits _ 512.  "desired size of p in bits"
	halfTwoToTheP _ 2 raisedTo: (pBits - 1).
	chunkCount _ pBits // 160.

	Transcript show: 'Searching for primes q and p...'; cr.
	[true] whileTrue: [
		Transcript show: '  Found a candidate q.'; cr.
		q _ random nextBits: 160.
		q _ q bitOr: 1. "ensure it is odd"
		q _ q bitOr: 1 << 160. "ensure it is of the requiered length"
		q _ (PrimesFinder candidate: q) nextPrime.
		twoQ _ q bitShift: 1.
		n _ 2.
		c _ 0.
		[c < 4096] whileTrue: [
			w _ random nextBits: pBits.
			x _ w + halfTwoToTheP.
			p _ (x - ( x \\ twoQ)) + 1.
			p highBit = pBits ifTrue: [
				Transcript show: '    Testing potential p ', (c + 1) printString, '...'; cr.
				(self isProbablyPrime: p) ifTrue: [
					Transcript show: '  Found p!'; cr.
					^ self]].
			n _ n + chunkCount + 1.
			c _ c + 1]]