private
processEncrypted: mailMsg

	| contentInfo recipientInfo contentEncryptionKey iv tdes decrypted |
	self canDecrypt ifFalse: [^ self error: 'cannot decrypt'].
	contentInfo := ASN1Stream 
		decodeBytes: mailMsg body content asByteArray
		withType: ((ASN1Module name: #cms) find: #ContentInfo).
	recipientInfo := contentInfo content recipientInfos 
		detect: [:e | e rid serialNumber = self certStore ownerCert tbsCertificate serialNumber]
		ifNone: [^ self error: 'no matching certificate'].
	contentEncryptionKey := self certStore ownerPrivateKey v15Decrypt: recipientInfo encryptedKey.
	iv := contentInfo content encryptedContentInfo contentEncryptionAlgorithm parameters.
	tdes := (TripleDES key: contentEncryptionKey) cbc initialVector: iv copy.
	decrypted := tdes decrypt: contentInfo content encryptedContentInfo encryptedContent.
	^ (MailMessage from: decrypted asString withSqueakLineEndings)
		parseParts;
		yourself.
