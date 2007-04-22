api
certificateAt: name

	^ self certificates at: name ifAbsent: [nil].
