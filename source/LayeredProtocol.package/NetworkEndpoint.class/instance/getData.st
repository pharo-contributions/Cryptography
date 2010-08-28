accessing
getData

	| buf count |
	Processor yield.
	buf := ByteArray new: 1024.
	[socket dataAvailable
		ifTrue:
			[[count := socket receiveDataInto: buf.
			 ^buf copyFrom: 1 to: count]
				on: Error
				do: [:ex |  ^ nil]]
		ifFalse:
			[[socket waitForDataFor: 10] on: Error do: [:e | ]].
	 socket isConnected]
		whileTrue.
	^nil