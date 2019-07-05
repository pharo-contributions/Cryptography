Class {
	#name : #X509DistributionPoint,
	#superclass : #Object,
	#instVars : [
		'distributionPoint',
		'reasons',
		'cRLIssuer'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509DistributionPoint >> cRLIssuer [
	"Answer the value of cRLIssuer"

	^ cRLIssuer
]

{ #category : #accessing }
X509DistributionPoint >> cRLIssuer: anObject [
	"Set the value of cRLIssuer"

	cRLIssuer := anObject
]

{ #category : #accessing }
X509DistributionPoint >> distributionPoint [
	"Answer the value of distributionPoint"

	^ distributionPoint
]

{ #category : #accessing }
X509DistributionPoint >> distributionPoint: anObject [
	"Set the value of distributionPoint"

	distributionPoint := anObject
]

{ #category : #accessing }
X509DistributionPoint >> reasons [
	"Answer the value of reasons"

	^ reasons
]

{ #category : #accessing }
X509DistributionPoint >> reasons: anObject [
	"Set the value of reasons"

	reasons := anObject
]
