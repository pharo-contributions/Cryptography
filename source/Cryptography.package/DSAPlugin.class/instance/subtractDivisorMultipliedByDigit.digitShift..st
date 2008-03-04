private
subtractDivisorMultipliedByDigit: digit digitShift: digitShift
	"Multiply the divisor by the given digit (an integer in the range 0..255), shift it left by the given number of digits, and subtract the result from the current remainder. Answer true if there is an excess borrow, indicating that digit was one too large. (This case is quite rare.)"

	| borrow rIndex prod resultDigit |
	borrow _ 0.
	rIndex _ digitShift + 1.
	1 to: divisorDigitCount do: [:i |
		prod _ ((dsaDivisor at: i) * digit) + borrow.
		borrow _ prod bitShift: -8.
		resultDigit _ (dsaRemainder at: rIndex) - (prod bitAnd: 16rFF).
		resultDigit < 0 ifTrue: [  "borrow from the next digit"
			resultDigit _ resultDigit + 256.
			borrow _ borrow + 1].
		dsaRemainder at: rIndex put: resultDigit.
		rIndex _ rIndex + 1].

	"propagate the final borrow if necessary"
	borrow = 0 ifTrue: [^ false].
	resultDigit _ (dsaRemainder at: rIndex) - borrow.
	resultDigit < 0
		ifTrue: [  "digit was too large (this case is quite rare)"
			dsaRemainder at: rIndex put: resultDigit + 256.
			^ true]
		ifFalse: [
			dsaRemainder at: rIndex put: resultDigit.
			^ false].
