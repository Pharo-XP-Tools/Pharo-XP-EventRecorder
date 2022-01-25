Class {
	#name : #PXServerFileStorageTest,
	#superclass : #EREventRecorderFileStorageTest,
	#instVars : [
		'category'
	],
	#category : #'Pharo-XP-EventRecorder-Server-Tests'
}

{ #category : #running }
PXServerFileStorageTest >> setUp [
	super setUp.
	storage := PXServerFileStorage new.
	storage directory: fileSystem workingDirectory.
	
	category := Dictionary new.
	category at: PXEventMultiBundle categoryFieldName put: 'category'.
	category at: PXEventMultiBundle experienceIdFieldName put: 'experienceId'.
	category at: PXEventMultiBundle participantUUIDFieldName put: 'participantUUID'.
	category at: PXEventMultiBundle taskOrSurveyIdFieldName put: 'taskOrSurveyId'.
]

{ #category : #tests }
PXServerFileStorageTest >> testAtCategoryPut [ 
	| location input  |
	input := #[1 2 3 4].
	location := storage atCategory: (STON toString: category) put: input.
	self assertLocation: location input: input
]

{ #category : #tests }
PXServerFileStorageTest >> testBuildDirectoryIn [

	| dir segments |
	dir := storage buildDirectory: category in: storage directory.
	segments := dir pathSegments.
	self assert: dir exists.
	self assert: segments size equals: 4.
	self assert: segments first equals: (category at: PXEventMultiBundle categoryFieldName). 
	self assert: segments second equals: (category at: PXEventMultiBundle experienceIdFieldName). 
	self assert: segments third equals: (category at: PXEventMultiBundle participantUUIDFieldName). 
	self assert: segments fourth equals: (category at: PXEventMultiBundle taskOrSurveyIdFieldName)
]
