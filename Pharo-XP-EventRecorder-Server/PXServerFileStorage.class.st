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
	subDirectory := self buildDirectory: (STON fromString: aSTONString) in: self directory.

	fileName := UUID new printString , '-'
	            , DateAndTime now asUnixTime printString.
	
	file := subDirectory / fileName.
	file binaryWriteStreamDo: [ :aStream | 
		aStream nextPutAll: aByteArray ].
	
	^ file fullName
]

{ #category : #accessing }
PXServerFileStorage >> buildDirectory: category in: parent [

	| dir |
	dir := parent / (category at: PXEventMultiBundle categoryFieldName)
	       / (category at: PXEventMultiBundle experienceIdFieldName)
	       / (category at: PXEventMultiBundle participantUUIDFieldName)
	       / (category at: PXEventMultiBundle taskOrSurveyIdFieldName).
	dir ensureCreateDirectory.
	^ dir
]
