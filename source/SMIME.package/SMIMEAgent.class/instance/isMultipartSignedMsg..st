api
isMultipartSignedMsg: mailMsg

	^ mailMsg body contentType = 'multipart/signed'
