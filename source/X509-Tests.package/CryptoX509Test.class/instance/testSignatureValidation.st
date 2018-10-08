as yet unclassified
testSignatureValidation

	self assert: (self certificate1 verifyFromParentCertificate: self certificate1).
