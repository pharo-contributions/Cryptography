private
pvtListenLoop
	[
		self pvtNewListenLoop
	] on: Error do: [ :ex |
		process _ nil.
		self destroySockets.
		ex pass.
	]