as yet unclassified
testAsnDerEncoding

	self assert: self certificate1 asAsn1Bytes = self certificate1DerBytes.
	self assert: self certificate2 asAsn1Bytes = self certificate2DerBytes.
	self assert: self certificate3 asAsn1Bytes = self certificate3DerBytes.
	self assert: self certificate4 asAsn1Bytes = self certificate4DerBytes.
