Class {
	#name : #ProtocolLayerWriteStrategy,
	#superclass : #ProtocolLayerStrategy,
	#category : 'LayeredProtocol-Extras'
}

{ #category : #protocol }
ProtocolLayerWriteStrategy >> basicDowncallAll: chunk [

	self protocolLayer basicDowncallAll: chunk.

]

{ #category : #protocol }
ProtocolLayerWriteStrategy >> downcallAll: chunk [

	self basicDowncallAll: chunk.

]
