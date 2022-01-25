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

{ #category : #initialization }
PXServerDelegate >> initialize [
	putHandler := EREventRecorderPutHandler new.
	self flag: 'determine where the data should be stored in the server'.
	putHandler storage: (PXServerFileStorage new
		directory: FileLocator home / 'gt' / 'events'; 
		yourself).
	self flag: ''.	
	dispatcher := ZnDispatcherDelegate new.
	self initializeDispatcher
]

{ #category : #initialization }
PXServerDelegate >> initializeDispatcher [

	dispatcher map: '/' to: putHandler
]
