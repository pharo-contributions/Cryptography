as yet unclassified
asMessage

	^ (SSLMessage messageAtType: self type) 
		fromBytes: self fragment.