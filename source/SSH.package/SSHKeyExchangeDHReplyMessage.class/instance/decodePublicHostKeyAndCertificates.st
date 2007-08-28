process
decodePublicHostKeyAndCertificates

	| stream id p q g y e n |
	stream := self publicHostKeyAndCertificates asByteArray readStream.
	id := (stream next: (stream next: 4) asInteger) asString.
	id = 'ssh-dss'
		ifTrue: [
			p := self fromMpintOnStream: stream.
			q := self fromMpintOnStream: stream.
			g := self fromMpintOnStream: stream.
			y := self fromMpintOnStream: stream.
			^ self publicHostKeyAndCertificates: (DSAPublicKey p: p q: q g: g y: y)].
	id = 'ssh-rsa'
		ifTrue: [
			e := self fromMpintOnStream: stream.
			n := self fromMpintOnStream: stream.
			^ self publicHostKeyAndCertificates: (RSAKey exponent: e modulo: n)].
