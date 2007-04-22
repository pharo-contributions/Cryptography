private
decodeExtension

	| type ext |
	type := self asn1TypeForExtension.
	ext := [ASN1Stream decodeBytes: self extnValue withType: type]
		on: Error
		do: [:ex | ASN1Stream decodeBytes: self extnValue].
	self decodedExtension: ext.
