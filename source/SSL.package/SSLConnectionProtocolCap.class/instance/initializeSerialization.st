initialize-release
initializeSerialization

	self duplexStack pushUp: RecordDeserializer new.
	self duplexStack pushDown: RecordSerializer new.
