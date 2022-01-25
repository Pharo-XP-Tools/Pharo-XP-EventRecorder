"
I am the server for PX experiments.
I just specialize the server url.
I also add some convenience for development and some automatic local configuration.
"
Class {
	#name : #PXServer,
	#superclass : #EREventRecorderServer,
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #'start-stop' }
PXServer class >> serverURL [
	^'http://localhost:8008'
]

{ #category : #'start-stop' }
PXServer class >> start [
	<example>
	EREventRecorderSettings url: self serverURL.
	(ZnServer startDefaultOn: 8008)
		route: '';
		delegate: PXServerDelegate new
]

{ #category : #'start-stop' }
PXServer class >> stop [
	<example>
	ZnServer stopDefault
]
