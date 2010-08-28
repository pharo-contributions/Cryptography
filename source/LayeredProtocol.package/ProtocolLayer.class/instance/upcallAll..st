stack
upcallAll: aCollection
	"Receive aCollection of data from my low protocol.  By default I act as if each datum had been received individually."

	aCollection do: [:b | self upcall: b]