private
nextRandom160
	"Answer a newly generated 160-bit random number in the range [1..(2^160 - 1)]."
	"Details: Try again in the extremely unlikely chance that zero is encountered."

	| result |
	result _ 0.
	[result = 0] whileTrue: [
		result _ SHA1 new hashInteger: key seed: seed.
		key _ key + result + 1].
	^ result