"
I control how received data is stored locally.
"
Class {
	#name : #PXServerFileStorage,
	#superclass : #EREventRecorderFileStorage,
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #accessing }
PXServerFileStorage >> atCategory: aSTONString put: aByteArray [

	| subDirectory fileName file |
	subDirectory := (self directory / aSTONString)
		                ensureCreateDirectory;
		                yourself.
	fileName := UUID new printString , '-'
	            , DateAndTime now asUnixTime printString.
	file := subDirectory / fileName.
	file binaryWriteStreamDo: [ :aStream | 
		aStream nextPutAll: aByteArray ].
	^ aSTONString , '/' , fileName
]
