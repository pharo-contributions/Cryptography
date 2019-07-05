Class {
	#name : #X509IssuingDistributionPoint,
	#superclass : #Object,
	#instVars : [
		'distributionPoint',
		'onlyContainsUserCerts',
		'onlyContainsCACerts',
		'onlySomeReasons',
		'indirectCRL',
		'onlyContainsAttributeCerts'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509IssuingDistributionPoint >> distributionPoint [
	"Answer the value of distributionPoint"

	^ distributionPoint
]

{ #category : #accessing }
X509IssuingDistributionPoint >> distributionPoint: anObject [
	"Set the value of distributionPoint"

	distributionPoint := anObject
]

{ #category : #accessing }
X509IssuingDistributionPoint >> indirectCRL [
	"Answer the value of indirectCRL"

	^ indirectCRL
]

{ #category : #accessing }
X509IssuingDistributionPoint >> indirectCRL: anObject [
	"Set the value of indirectCRL"

	indirectCRL := anObject
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsAttributeCerts [
	"Answer the value of onlyContainsAttributeCerts"

	^ onlyContainsAttributeCerts
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsAttributeCerts: anObject [
	"Set the value of onlyContainsAttributeCerts"

	onlyContainsAttributeCerts := anObject
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsCACerts [
	"Answer the value of onlyContainsCACerts"

	^ onlyContainsCACerts
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsCACerts: anObject [
	"Set the value of onlyContainsCACerts"

	onlyContainsCACerts := anObject
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsUserCerts [
	"Answer the value of onlyContainsUserCerts"

	^ onlyContainsUserCerts
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlyContainsUserCerts: anObject [
	"Set the value of onlyContainsUserCerts"

	onlyContainsUserCerts := anObject
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlySomeReasons [
	"Answer the value of onlySomeReasons"

	^ onlySomeReasons
]

{ #category : #accessing }
X509IssuingDistributionPoint >> onlySomeReasons: anObject [
	"Set the value of onlySomeReasons"

	onlySomeReasons := anObject
]
