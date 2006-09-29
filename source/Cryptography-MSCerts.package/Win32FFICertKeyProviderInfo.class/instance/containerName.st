accessing
containerName
	| exData result |
	exData := self pwszContainerName.
	result := exData fromCMSWideString.
	exData free.
	^result