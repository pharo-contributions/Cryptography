printing
dataAsString
	"^(data withEncoding: #UTF8) readStream upToEnd"
	"^(MultiByteBinaryOrTextStream on: data encoding: 'utf-8') halt upToEnd"
	^data asString