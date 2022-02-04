"
I am the server for PX experiments.
I just specialize the server url.
I also add some convenience for development and some automatic local configuration.
"
Class {
	#name : #PXServer,
	#superclass : #EREventRecorderServer,
	#classInstVars : [
		'devMode'
	],
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #accessing }
PXServer class >> devMode [

	^ devMode ifNil:[devMode := false]
]

{ #category : #accessing }
PXServer class >> devMode: anObject [

	devMode := anObject
]

{ #category : #'start-stop' }
PXServer class >> serverURL [
	^'http://localhost:8008'
]

{ #category : #'start-stop' }
PXServer class >> start [

	<example>
	(ZnServer startDefaultOn: 8008)
		route: '';
		delegate: PXServerDelegate new
]

{ #category : #'start-stop' }
PXServer class >> stop [
	<example>
	ZnServer stopDefault
]
