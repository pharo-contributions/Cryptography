hashing
md5HashFinishedMsgsWithSenderValue: sender

	| bytes digest1 result1 digest2 |
	bytes := self securityParams messagesProcessedAsByteArray.
	digest1 := bytes, sender, self securityParams masterSecret, self md5Pad1.
	result1 := MD5 hashMessage: digest1.
	digest2 := self securityParams masterSecret, self md5Pad2, result1.
	^ MD5 hashMessage: digest2
