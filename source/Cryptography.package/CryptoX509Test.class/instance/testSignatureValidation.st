as yet unclassified
testSignatureValidation

	self assert: (self certificate1 verifyFromParentCertificate: self certificate1).
	self assert: (self certificate3 verifyFromParentCertificate: self certificate3).
	self assert: (self certificate4 verifyFromParentCertificate: self certificate4).
