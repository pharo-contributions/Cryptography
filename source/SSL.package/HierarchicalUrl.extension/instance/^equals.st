*ssl
= anotherUrl

	^ self schemeName = anotherUrl schemeName 
		and: [self authority = anotherUrl authority 
		and: [self port = anotherUrl port 
		and: [self fragment = anotherUrl fragment
		and: [self username = anotherUrl username
		and: [self password = anotherUrl password
		and: [self fullPath = anotherUrl fullPath]]]]]].
