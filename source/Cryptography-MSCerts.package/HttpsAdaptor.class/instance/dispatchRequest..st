protocol
dispatchRequest: request 
	"<HttpResponse> Dispatches an HttpRequest as a method to the target and
	answers an HttpResponse to be transferred to the client"
	| response |
	response := self errorHandler
				handleDispatchErrorsIn: [self class current: self.
					HttpRequest current: request.
					request isHandshakeRequest
						ifTrue: [request response]
						ifFalse: [self target processHttpRequest: request]].
	response
		ifNil: [response := self notFoundResponseFor: request].
	response addCookies: request responseCookies.
	^ response