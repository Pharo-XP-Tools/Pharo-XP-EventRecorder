"
I extend EREventMultiBundle with new meta data that I store into the aZnMultiPartFormDataEntity sent over the network.
"
Class {
	#name : #PXEventMultiBundle,
	#superclass : #EREventMultiBundle,
	#category : #'Pharo-XP-EventRecorder-Client'
}

{ #category : #private }
PXEventMultiBundle >> updateEntity: aZnMultiPartFormDataEntity forSingleBundle: aSingleBundle [

	super
		updateEntity: aZnMultiPartFormDataEntity
		forSingleBundle: aSingleBundle.
	aZnMultiPartFormDataEntity addPart: (ZnMimePart
			 fieldName: 'experienceId'
			 value: aSingleBundle experienceId).
	aZnMultiPartFormDataEntity addPart: (ZnMimePart
			 fieldName: 'participantUUID'
			 value: aSingleBundle participantUUID).
	aZnMultiPartFormDataEntity addPart: (ZnMimePart
			 fieldName: 'taskOrSurveyId'
			 value: aSingleBundle taskOrSurveyId)
]
