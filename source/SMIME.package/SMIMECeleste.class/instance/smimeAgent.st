accessing
smimeAgent
	"Answer the value of smimeAgent"

	smimeAgent isNil ifTrue: [smimeAgent := SMIMEAgent new].
	^ smimeAgent