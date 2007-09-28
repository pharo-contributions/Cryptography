process
asByteArray

	| bytes |
	bytes := super asByteArray, 
		(self stringOn: self name),
		(self stringOn: self instruction),
		(self stringOn: self language),
		(self numPrompts asByteArrayOfSize: 4).
	self prompts with: self echos do: [:prompt :echo |
		bytes := bytes, (self stringOn: prompt).
		bytes := bytes, (echo ifTrue:[#(1)] ifFalse: [#(0)])].
	^ bytes
