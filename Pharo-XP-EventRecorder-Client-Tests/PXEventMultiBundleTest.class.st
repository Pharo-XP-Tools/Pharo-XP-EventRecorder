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
	
	entity := ZnMultiPartFormDataEntity new.
	multiBundle updateEntity: entity forSingleBundle: pxBundle.
	self assert: (entity parts detect:[:e| e fieldName = 'experienceId']) contents equals: pxBundle experienceId.
	self assert: (entity parts detect:[:e| e fieldName = 'participantUUID']) contents equals: pxBundle participantUUID.
	self assert: (entity parts detect:[:e| e fieldName = 'taskOrSurveyId']) contents equals: pxBundle taskOrSurveyId
]
