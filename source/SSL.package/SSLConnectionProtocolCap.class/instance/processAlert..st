protocol
processAlert: alert

	alert isFatal
		ifTrue: [self kill].
