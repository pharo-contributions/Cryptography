initialize-release
initialize

	upBlock := [:arg | self notify: 'up ' , arg printString].
	downBlock := [:arg | self notify: 'down ' , arg printString].
	flushBlock := [].
	noteBlock := [:s :a | ]