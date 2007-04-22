process
verifyMAC: data

	data is20Record ifTrue: [^data].
	^ self macState verifyMAC: data