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

	| buildDirPathBlock dir |	
	buildDirPathBlock := [ :key | (category at: key) ifNotNil: [ :path| dir := dir / path] ].
	
	dir := parent.
	buildDirPathBlock value: PXEventMultiBundle categoryFieldName.
	buildDirPathBlock value: PXEventMultiBundle experienceIdFieldName.
	buildDirPathBlock value: PXEventMultiBundle participantUUIDFieldName.
	buildDirPathBlock value: PXEventMultiBundle taskOrSurveyIdFieldName.		

	dir ensureCreateDirectory.
	^ dir
]
