accessing
atEmail: email

	^ self storeData certificateMap at: email ifAbsent: [OrderedCollection new].
