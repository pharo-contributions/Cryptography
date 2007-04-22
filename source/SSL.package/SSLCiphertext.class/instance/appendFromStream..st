converting
appendFromStream: stream

	| nextChunk |
	nextChunk := stream next: (self length - self fragment size).
	self fragment: self fragment, nextChunk.
