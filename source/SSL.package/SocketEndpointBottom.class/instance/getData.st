process
getData

	| buf count |
	Processor yield.
	buf := ByteArray new: 18432.
	[self socket dataAvailable
		ifTrue:
			[[count := self socket receiveDataInto: buf.
			 ^buf copyFrom: 1 to: count]
				on: Error
				do: [:ex | ^ nil]]
		ifFalse:
			[[self socket waitForDataFor: 10] on: Error do: [:e | ]].
	 self isConnected]
		whileTrue.
	^nil