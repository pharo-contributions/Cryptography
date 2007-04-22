hashing
shaHashFinishedMsgsWithSenderValue: sender

	| bytes digest1 result1 digest2 |
	bytes := self securityParams messagesProcessedAsByteArray.
	digest1 := bytes, sender, self securityParams masterSecret, self shaPad1.
	result1 := SHA1 hashMessage: digest1.
	digest2 := self securityParams masterSecret, self shaPad2, result1.
	^ SHA1 hashMessage: digest2.
