testing
example2
	"self example2"

	| bytes str helloBytes helloStream |	
	bytes := #(128 43 1 0 2 0 18 0 0 0 16 1 0 128 7 0 192 3 0 128 6 0 64 2 0 128 4 0 128 18 145 126 159 99 206 21 47 126 23 1 210 138 248 137 86) asByteArray.

	str := ReadStream on: bytes.
	str next = 128
		ifTrue: [
			helloBytes := str next: str next.
			helloStream := ReadStream on: helloBytes.
			^helloStream next = 1
				ifTrue: [
					SSL20ClientHelloMsg fromStream: helloStream]]
