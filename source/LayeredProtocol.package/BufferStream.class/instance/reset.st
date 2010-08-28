initialize-release
reset
	"hack"
	self on: 
		(buffer 
			ifNil: ['']
			ifNotNil: [buffer class new: 0])