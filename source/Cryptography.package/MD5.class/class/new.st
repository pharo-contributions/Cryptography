as yet unclassified
new

	self isPluginAvailable 
		ifTrue: [ ^MD5WithPrimitive basicNew ]
		ifFalse: [ ^MD5NonPrimitive basicNew ]