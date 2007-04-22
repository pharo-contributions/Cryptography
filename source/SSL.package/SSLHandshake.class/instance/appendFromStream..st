converting
appendFromStream: stream

	| nextChunk |
	nextChunk := stream next: (self length - self body size).
	self body: self body, nextChunk.
