instance creation
fromBytes: bytes withSecurityParams: securityParams

	| stream |
	stream := ReadStream on: bytes.
	^ self fromStream: stream withSecurityParams: securityParams.
