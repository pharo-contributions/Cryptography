private
pvtListenLoop
	[
		self pvtNewListenLoop
	] on: Error do: [ :ex |
		process := nil.
		self destroySockets.
		ex pass.
	]