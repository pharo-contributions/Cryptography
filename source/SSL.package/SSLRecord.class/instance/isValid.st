queries
isValid

	(#(20 21 22 23) includes: self type)
		ifFalse: [^ false].
	((Array 
		with: SSLProtocolVersion tls11
		with: SSLProtocolVersion tls10 
		with: SSLProtocolVersion ssl30) 
			includes: self version)
		ifFalse: [^ false].
	(self length < self sizeLimit)
		ifFalse: [^ false].
	^ true.
