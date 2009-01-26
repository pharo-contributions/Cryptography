private-rounds
round: data selector: selector round: round
	"Do one round with the given function"

	| shiftIndex template abcd |
	1 to: 16 do: [ :i |
		shiftIndex _ (i - 1) \\ 4 + 1.
		abcd _ ABCDTable at: shiftIndex.
		template _ {
			abcd at: 1. abcd at: 2. abcd at: 3. abcd at: 4.
			(IndexTable at: round) at: i.
			(ShiftTable at: round) at: shiftIndex.
			SinTable at: round - 1 * 16 + i }.
		self step: data template: template selector: selector ].
