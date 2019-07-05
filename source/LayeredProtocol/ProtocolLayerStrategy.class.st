Class {
	#name : #ProtocolLayerStrategy,
	#superclass : #Object,
	#instVars : [
		'protocolLayer'
	],
	#category : 'LayeredProtocol-Extras'
}

{ #category : #'instance creation' }
ProtocolLayerStrategy class >> newOnLayer: layer [

	^ self new
		protocolLayer: layer;
		yourself
]

{ #category : #accessing }
ProtocolLayerStrategy >> protocolLayer [
	"Answer the receiver's instance variable protocolLayer."

	^protocolLayer
]

{ #category : #accessing }
ProtocolLayerStrategy >> protocolLayer: anObject [
	"Set the receiver's instance variable protocolLayer to anObject."

	protocolLayer := anObject
]
