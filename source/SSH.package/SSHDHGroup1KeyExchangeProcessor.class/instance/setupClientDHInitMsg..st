setup
setupClientDHInitMsg: dhInitMsg

	self e: diffieHellman sendMessage.
	dhInitMsg e: self e.
	