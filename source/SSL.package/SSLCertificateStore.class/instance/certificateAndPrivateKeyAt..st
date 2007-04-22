api
certificateAndPrivateKeyAt: name

	^ Array
		with: (self certificateAt: name)
		with: (self privateKeyAt: name).

