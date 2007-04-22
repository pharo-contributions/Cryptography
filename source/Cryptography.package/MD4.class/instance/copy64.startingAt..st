copying
copy64: anArray startingAt: n 
	| array u answer |
	array _ anArray collect: [:char | char asInteger].
	answer _ Array new: 16.
	1 to: answer size
		do: 
			[:i | 
			u _ (array at: i - 1 * 4 + 3 + n) << 24.
			u _ u bitOr: (array at: i - 1 * 4 + 2 + n) << 16.
			u _ u bitOr: (array at: i - 1 * 4 + 1 + n) << 8.
			u _ u bitOr: (array at: i - 1 * 4 + 0 + n) << 0.
			answer at: i put: u].
	^ answer