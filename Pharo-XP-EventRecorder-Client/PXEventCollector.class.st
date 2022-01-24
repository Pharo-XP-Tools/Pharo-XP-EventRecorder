"
I extend EREventCollector with new event meta data
"
Class {
	#name : #PXEventCollector,
	#superclass : #EREventCollector,
	#instVars : [
		'experienceId',
		'participantUUID',
		'taskOrSurveyId'
	],
	#category : #'Pharo-XP-EventRecorder-Client'
}

{ #category : #accessing }
PXEventCollector >> experienceId [

	^ experienceId
]

{ #category : #accessing }
PXEventCollector >> experienceId: anObject [

	experienceId := anObject
]

{ #category : #'instance creation' }
PXEventCollector >> newBundle [

	^ PXEventBundle new
]

{ #category : #'instance creation' }
PXEventCollector >> newBundleForPacking [

	| bundle |
	bundle := super newBundleForPacking.
	bundle
		experienceId: self experienceId;
		taskOrSurveyId: self taskOrSurveyId;
		participantUUID: self participantUUID.
	^bundle
]

{ #category : #accessing }
PXEventCollector >> participantUUID [

	^ participantUUID
]

{ #category : #accessing }
PXEventCollector >> participantUUID: anObject [

	participantUUID := anObject
]

{ #category : #accessing }
PXEventCollector >> taskOrSurveyId [

	^ taskOrSurveyId
]

{ #category : #accessing }
PXEventCollector >> taskOrSurveyId: anObject [

	taskOrSurveyId := anObject
]
