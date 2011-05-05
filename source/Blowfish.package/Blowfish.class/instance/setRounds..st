as yet unclassified
setRounds: anInteger

	rounds:=(anInteger >= self class minRounds and:[anInteger <= self class maxRounds]) ifTrue: [anInteger] ifFalse:[self class defaultRounds ]   