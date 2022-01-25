"
I control how received data is stored locally.
"
Class {
	#name : #PXServerFileStorage,
	#superclass : #EREventRecorderFileStorage,
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #accessing }
PXServerFileStorage >> atCategory: aString put: aByteArray [

	| subDirectory fileName file |
	subDirectory := (self directory / aString)
		                ensureCreateDirectory;
		                yourself.
	fileName := UUID new printString , '-'
	            , DateAndTime now asUnixTime printString.
	file := subDirectory / fileName.
	file binaryWriteStreamDo: [ :aStream | 
		aStream nextPutAll: aByteArray ].
	^ aString , '/' , fileName
]
