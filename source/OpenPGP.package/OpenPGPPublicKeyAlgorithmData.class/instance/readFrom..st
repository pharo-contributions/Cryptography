reading
readFrom: aStream
	mpis := (1 to: self numMPIs) collect: [:i | aStream nextMPI]