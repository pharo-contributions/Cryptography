computing
run
	| n buffer bb j offset |
	buffer _ ByteArray new: 128.
	n _ input size.
	bb _ n * 8.
	j _ 0.
	[n > 64]
		whileTrue: 
			[self mdFour64: (self copy64: input startingAt: j + 1).
			j _ j + 64.
			n _ n - 64].
	buffer atAllPut: 0.
	1 to: n do: [:i | buffer at: i put: (input at: j + i)].
	buffer at: n + 1 put: 16r80.
	offset _ n <= 55 ifTrue: [56] ifFalse: [120].
	self copy4: bb to: buffer startingAt: offset + 1.
	self mdFour64: (self copy64: buffer).
	n > 55 ifTrue: [self mdFour64: (self copy64: buffer startingAt: 64)].
	buffer atAllPut: 0.
	self copy4ToOutput.
	a _ b _ c _ d _ 0