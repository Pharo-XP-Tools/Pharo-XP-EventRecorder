Class {
	#name : #PXEventRecorderPutHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'handler',
		'entity',
		'category'
	],
	#category : #'Pharo-XP-EventRecorder-Server-Tests'
}

{ #category : #initialization }
PXEventRecorderPutHandlerTest >> buildTestCategory [
	| category |
	category := Dictionary new.
	category at: PXEventMultiBundle categoryFieldName put: 'category'.
	category at: PXEventMultiBundle experienceIdFieldName put: 'experienceId'.
	category at: PXEventMultiBundle participantUUIDFieldName put: 'participantUUID'.
	category at: PXEventMultiBundle taskOrSurveyIdFieldName put: 'taskOrSurveyId'.
	^STON toString: category
]

{ #category : #initialization }
PXEventRecorderPutHandlerTest >> buildUncompleteCategory [
	| category |
	category := Dictionary new.
	category at: PXEventMultiBundle categoryFieldName put: 'category'.
	category at: PXEventMultiBundle experienceIdFieldName put: 'experienceId'.
	^STON toString: category
]

{ #category : #initialization }
PXEventRecorderPutHandlerTest >> setUp [

	handler := PXEventRecorderPutHandler new.
	handler storage: self.
	entity := ZnMultiPartFormDataEntity new.
	category := self buildTestCategory.
	entity
		addPart: (ZnMimePart
				 fieldName: PXEventMultiBundle categoryFieldName
				 value: category);
		addPart: (ZnMimePart
				 fieldName: PXEventMultiBundle dataFieldName
				 entity: (ZnEntity bytes: '42' asByteArray))
]

{ #category : #tests }
PXEventRecorderPutHandlerTest >> testDetectFieldNamedInParts [

	self
		assert: (handler
				 detectFieldNamed: PXEventMultiBundle categoryFieldName
				 inParts: entity parts) fieldValue
		equals: category.
	self
		should: [ handler detectFieldNamed: 'test' inParts: entity parts ]
		raise: NotFound
]

{ #category : #tests }
PXEventRecorderPutHandlerTest >> testHasCategoryAndDataParts [

	self assert: (handler hasCategoryAndDataParts: entity parts).
	entity := ZnMultiPartFormDataEntity new.
	self deny: (handler hasCategoryAndDataParts: entity parts).
	
	"We remove some data from the category fields"
	entity 
		addPart: (ZnMimePart fieldName: PXEventMultiBundle categoryFieldName value: self buildUncompleteCategory);
		addPart: (ZnMimePart fieldName: PXEventMultiBundle dataFieldName entity: (ZnEntity bytes: '42' asByteArray)).	
	self deny: (handler hasCategoryAndDataParts: entity parts)
]
