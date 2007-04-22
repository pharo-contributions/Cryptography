accessing
nextBytesNonZero: byteLength

	| answer bytesWritten tempArray tempIndex |
	answer := ByteArray new: byteLength.
	bytesWritten := 0.
	tempIndex := 20.
	[bytesWritten < byteLength]
		whileTrue: [
			tempIndex >= 20 ifTrue: [
				tempArray := self nextRandom160 asByteArrayOfSize: 20.
				tempIndex := 1].
			(tempArray at: tempIndex) ~= 0 ifTrue: [
				answer at: (bytesWritten := bytesWritten + 1) put: (tempArray at: tempIndex)].
			tempIndex := tempIndex + 1].
	^ answer