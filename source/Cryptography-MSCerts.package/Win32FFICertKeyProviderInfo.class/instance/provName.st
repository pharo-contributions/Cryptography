accessing
provName
	| exData result |
	exData := self pwszProvName.
	result := exData fromCMSWideString.
	exData free.
	^result