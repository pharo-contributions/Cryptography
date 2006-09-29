initialize-release
initialize
	self handShake: (TLSHandShake fromClientHello: self).
	self extensions: OrderedCollection new.