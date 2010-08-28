protocol
stop
	self
		do: [:proto | proto close].
	self kill