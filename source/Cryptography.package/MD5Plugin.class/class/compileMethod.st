code generation
compileMethod
	"self compileMethod"

	self compile: self generateMethod
		classified: 'generated'