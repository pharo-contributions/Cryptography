stack
downcallAll: aCollection
	"Receive aCollection of data from my high protocol.  The default behaviour is to act as if each datum was received individually."

	aCollection do: [:elt | self downcall: elt]