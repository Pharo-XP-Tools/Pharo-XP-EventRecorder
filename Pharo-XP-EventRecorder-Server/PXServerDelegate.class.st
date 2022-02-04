"
I am the delegate called upon reception of requests.
Basically I just initialize a root route and the handlers I use to treat my requests.
I only allow for answering specific PUT requests through a PXEventRecorderPutHandler.
"
Class {
	#name : #PXServerDelegate,
	#superclass : #EREventRecorderDelegate,
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #accessing }
PXServerDelegate >> dispatcher [
	"for tests"
	^ dispatcher
]

{ #category : #public }
PXServerDelegate >> handleRequest: request [
	PXServer devMode ifTrue:[request contents crTrace].
	^ super handleRequest: request
]

{ #category : #initialization }
PXServerDelegate >> initialize [
	putHandler := PXEventRecorderPutHandler new.
	putHandler storage: (PXServerFileStorage new
		directory: FileLocator home / 'px-experiments' / 'data'; 
		yourself).
	
	dispatcher := ZnDispatcherDelegate new.
	self initializeDispatcher
]

{ #category : #initialization }
PXServerDelegate >> initializeDispatcher [

	dispatcher map: '/' to: putHandler
]
