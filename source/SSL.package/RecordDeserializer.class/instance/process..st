protocol
process: data 

	| fullData stream record |
	self leftOverData notEmpty
		ifTrue: [fullData := self leftOverData, data]
		ifFalse: [fullData := data].
	stream := fullData readStream.
	[stream atEnd or: [stream size - stream position < 5]]
		whileFalse: [
			self pendingRecord notNil 
				ifTrue: [record := self pendingRecord appendFromStream: stream]
				ifFalse: [stream peek = 128
					ifTrue: [record := SSL20Record fromStream: stream]
					ifFalse: [record := SSLCiphertext fromStream: stream]].
			record isValid ifFalse: [SSLError new code: 22; signal: 'record overflow'].
			record isFullFragment 
				ifTrue: [self pendingRecord: nil.
					self basicProcess: record]
				ifFalse: [self pendingRecord: record]].
	self leftOverData: stream upToEnd.
