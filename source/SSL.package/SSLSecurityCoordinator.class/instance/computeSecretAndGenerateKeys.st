secret
computeSecretAndGenerateKeys

	| keyBlock |
	self computeSecret.
	keyBlock := self generateKeyBlock.
	self installKeysFromKeyBlock: keyBlock.
