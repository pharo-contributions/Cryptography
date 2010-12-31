hash algorithms
testSHA256Implementations
	"Check if the two implementations give the same results. Do nothing if the plugin is not available"

	| data |
	SHA256 isPluginAvailable ifFalse: [ ^self ].
	data := ''.
	100 timesRepeat: [ 
		| primitive nonPrimitive |
		primitive := SHA256NonPrimitive basicNew hashMessage: data.
		nonPrimitive := SHA256WithPrimitive basicNew hashMessage: data.
		self assert: primitive = nonPrimitive.
		data := data, 'Squeak' ]