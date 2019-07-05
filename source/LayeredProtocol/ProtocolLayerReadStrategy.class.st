Class {
	#name : #ProtocolLayerReadStrategy,
	#superclass : #ProtocolLayerStrategy,
	#category : 'LayeredProtocol-Extras'
}

{ #category : #protocol }
ProtocolLayerReadStrategy >> basicUpcallAll: chunk [

	self protocolLayer basicUpcallAll: chunk.

]

{ #category : #protocol }
ProtocolLayerReadStrategy >> upcallAll: chunk [

	self basicUpcallAll: chunk
]
