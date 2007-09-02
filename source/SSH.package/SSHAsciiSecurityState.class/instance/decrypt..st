process
decrypt: dataStream

	^ (dataStream upToAll: String lf asByteArray) asString.
