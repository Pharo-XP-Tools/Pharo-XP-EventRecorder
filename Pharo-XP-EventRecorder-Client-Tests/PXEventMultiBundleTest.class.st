Class {
	#name : #PXEventMultiBundleTest,
	#superclass : #EREventMultiBundleTest,
	#instVars : [
		'pxBundle'
	],
	#category : #'Pharo-XP-EventRecorder-Client-Tests'
}

{ #category : #running }
PXEventMultiBundleTest >> setUp [

	super setUp.
	pxBundle := PXEventBundle new
		            url: 'http://localhost/px/events1' asZnUrl;
		            category: #c1;
		            experienceId: #px;
		            participantUUID: #pUUID;
		            taskOrSurveyId: #tosID;
		            data: #[ 1 2 3 ];
		            yourself.
	multiBundle := PXEventMultiBundle new
]

{ #category : #tests }
PXEventMultiBundleTest >> testUpdateEntityForSingleBundle [

	| category |
	entity := ZnMultiPartFormDataEntity new.
	multiBundle updateEntity: entity forSingleBundle: pxBundle.

	category := STON fromString: (entity parts detect: [ :e | 
			             e fieldName = PXEventMultiBundle categoryFieldName ])
			            fieldValue.
	self
		assert: (category at: PXEventMultiBundle categoryFieldName)
		equals: pxBundle category.
	self
		assert: (category at: PXEventMultiBundle experienceIdFieldName)
		equals: pxBundle experienceId.
	self
		assert: (category at: PXEventMultiBundle participantUUIDFieldName)
		equals: pxBundle participantUUID.
	self
		assert: (category at: PXEventMultiBundle taskOrSurveyIdFieldName)
		equals: pxBundle taskOrSurveyId.

	self
		assert: (entity parts detect: [ :e | 
				 e fieldName = PXEventMultiBundle dataFieldName ]) contents
		equals: pxBundle entity contents
]
