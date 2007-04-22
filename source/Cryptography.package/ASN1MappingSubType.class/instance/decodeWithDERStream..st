decoding
decodeWithDERStream: derStream

	| target val |
	target := self mapping new.
	val := self parent decodeWithDERStream: derStream.
	target perform: self mutator with: val.
	^ target
