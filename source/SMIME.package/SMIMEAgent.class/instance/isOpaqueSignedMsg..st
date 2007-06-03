api
isOpaqueSignedMsg: mailMsg

	^ mailMsg body contentType = 'application/pkcs7-mime'
		and: [((mailMsg fieldNamed: 'content-type')
			parameterAt: 'smime-type') = 'signed-data']
