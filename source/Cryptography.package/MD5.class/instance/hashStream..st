accessing
hashStream: aPositionableStream
	"MD5 new hashStream: (ReadStream on: 'foo')"
	| startPosition buf bitLength |
	self initialize.

	"aPositionableStream atEnd ifTrue: [self error: 'empty stream']."

	startPosition _ aPositionableStream position.
	[aPositionableStream atEnd] whileFalse: [
		buf _ aPositionableStream next: 64.
		(aPositionableStream atEnd not and: [buf size = 64])
			ifTrue: [self processBuffer: buf]
			ifFalse: [
				bitLength _ (aPositionableStream position - startPosition) * 8.
				self processFinalBuffer: buf bitLength: bitLength]].

	^ self finalValue