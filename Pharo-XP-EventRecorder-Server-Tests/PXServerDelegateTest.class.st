Class {
	#name : #PXServerDelegateTest,
	#superclass : #TestCase,
	#instVars : [
		'handler',
		'entity',
		'category'
	],
	#category : #'Pharo-XP-EventRecorder-Server-Tests'
}

{ #category : #tests }
PXServerDelegateTest >> testDispatcherMap [
	|delegate|
	delegate := PXServerDelegate new.
	self assert: (delegate dispatcher dispatcherDictionary at: '/') identicalTo: delegate putHandler 
]

{ #category : #tests }
PXServerDelegateTest >> testPutHandler [
	self assert: PXServerDelegate new putHandler class identicalTo: PXEventRecorderPutHandler 
]
