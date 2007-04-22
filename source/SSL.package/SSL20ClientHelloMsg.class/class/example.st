testing
example
	"self example"

	| bytes str helloBytes helloStream |	
	bytes := #(128 76 1 3 0 0 51 0 0 0 16 0 0 4 0 0 5 0 0 10 1 0 128 7 0 192 3 0 128 0 0 9 6 0 64 0 0 100 0 0 98 0 0 3 0 0 6 2 0 128 4 0 128 0 0 19 0 0 18 0 0 99 121 228 74 217 176 76 225 19 0 3 140 74 104 45 35 228) asByteArray.

	str := ReadStream on: bytes.
	str next = 128
		ifTrue: [
			helloBytes := str next: str next.
			helloStream := ReadStream on: helloBytes.
			^helloStream next = 1
				ifTrue: [
					SSL20ClientHelloMsg fromStream: helloStream]]
