hash algorithms
testMD5Implementations
	"Check if the two implementations give the same results. Do nothing if the plugin is not available"

	| data |
	MD5 isPluginAvailable ifFalse: [ ^self ].
	data := ''.
	100 timesRepeat: [ 
		| primitive nonPrimitive |
		primitive := MD5NonPrimitive basicNew hashMessage: data.
		nonPrimitive := MD5WithPrimitive basicNew hashMessage: data.
		self assert: primitive = nonPrimitive.
		data := data, 'Squeak' ]