computing
iterate
	| b t x |
	iterations _ iterations + 1.
	b _ SecureRandom picker nextInt: samples.
	(target gcd: b) = 1 ifFalse: [^ satisfied _ false].
	t _ 0.
	x _ b raisedTo: n0 modulo: target.
	(x = 1 or: [x = minusOne]) ifFalse: [
		[x _ x squared \\ target.
		t _ t + 1.
		satisfied _ x = minusOne.
		satisfied not and: [t < k]] whileTrue.
		satisfied ifFalse: [^ satisfied]]
