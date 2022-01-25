"
I extend EREventMultiBundle with new meta data that I store into the aZnMultiPartFormDataEntity sent over the network.
"
Class {
	#name : #PXEventMultiBundle,
	#superclass : #EREventMultiBundle,
	#category : #'Pharo-XP-EventRecorder-Client'
}

{ #category : #accessing }
PXEventMultiBundle class >> allFieldNames [

	^ { 
		  self categoryFieldName.
		  self experienceIdFieldName.
		  self participantUUIDFieldName.
		  self taskOrSurveyIdFieldName.
		  self dataFieldName }
]

{ #category : #accessing }
PXEventMultiBundle class >> categoryFieldName [
	^'category'
]

{ #category : #accessing }
PXEventMultiBundle class >> dataFieldName [
	^'data'
]

{ #category : #accessing }
PXEventMultiBundle class >> experienceIdFieldName [
	^'experienceId'
]

{ #category : #accessing }
PXEventMultiBundle class >> metaDataFieldNames [

	^ { 
		  self categoryFieldName.
		  self experienceIdFieldName.
		  self participantUUIDFieldName.
		  self taskOrSurveyIdFieldName }
]

{ #category : #accessing }
PXEventMultiBundle class >> participantUUIDFieldName [
	^'participantUUID'
]

{ #category : #accessing }
PXEventMultiBundle class >> taskOrSurveyIdFieldName [
	^'taskOrSurveyId'
]

{ #category : #private }
PXEventMultiBundle >> updateEntity: aZnMultiPartFormDataEntity forSingleBundle: aSingleBundle [

	| category |
	category := Dictionary new.
	category at: self class categoryFieldName put: aSingleBundle category.
	category at: self class experienceIdFieldName put: aSingleBundle experienceId.
	category at: self class participantUUIDFieldName put: aSingleBundle participantUUID.
	category at: self class taskOrSurveyIdFieldName put: aSingleBundle taskOrSurveyId.

	aZnMultiPartFormDataEntity addPart: (ZnMimePart
			 fieldName: self class categoryFieldName
			 value: (STON toString: category)).
	aZnMultiPartFormDataEntity addPart: (ZnMimePart
			 fieldName: self class dataFieldName
			 entity: aSingleBundle entity)
]
