setup
setupClientDHInitMsg: dhInitMsg

	e := diffieHellman sendMessage.
	dhInitMsg e: e.
	