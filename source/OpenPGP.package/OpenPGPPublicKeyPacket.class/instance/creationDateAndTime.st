accessing
creationDateAndTime
	| t |
	t := self creationTime + 2177452800.
	"^Array with: (Date fromSeconds: t) with: (Time fromSeconds: t\\86400)"
	^DateAndTime fromSeconds: t