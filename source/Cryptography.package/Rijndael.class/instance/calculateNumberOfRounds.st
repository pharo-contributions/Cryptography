setup
calculateNumberOfRounds
	nK = 4 ifTrue: [
		nB = 4 ifTrue: [nR _ 10].
		nB = 6 ifTrue: [nR _ 12].
		nB = 8 ifTrue: [nR _ 14]].
	nK = 6 ifTrue: [
		nB = 4 ifTrue: [nR _ 12].
		nB = 6 ifTrue: [nR _ 12].
		nB = 8 ifTrue: [nR _ 14]].
	nK = 8 ifTrue: [
		nB = 4 ifTrue: [nR _ 14].
		nB = 6 ifTrue: [nR _ 14].
		nB = 8 ifTrue: [nR _ 14]].

