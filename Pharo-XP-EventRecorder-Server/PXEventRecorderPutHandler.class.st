"
I am a dedicated handler for put requests received by a PXServerDelegate.
Basically I specialize how I consider parts of a request and how I save these parts on disk.
Specifically, I extract parts from the request to obtain the experience name, the participant uuid and the id of the task or the survey which data is contained into the request.
"
Class {
	#name : #PXEventRecorderPutHandler,
	#superclass : #EREventRecorderPutHandler,
	#category : #'Pharo-XP-EventRecorder-Server'
}

{ #category : #testing }
PXEventRecorderPutHandler >> detectFieldNamed: aFieldNamed inParts: aCollection [

	^ aCollection detect: [ :e | e fieldName = aFieldNamed ]
]

{ #category : #testing }
PXEventRecorderPutHandler >> hasCategoryAndDataParts: aCollection [

	| category |
	(super hasCategoryAndDataParts: aCollection) ifFalse: [ ^ false ].

	category := [ 
	            STON fromString: (self
			             detectFieldNamed: PXEventMultiBundle categoryFieldName
			             inParts: aCollection) fieldValue ]
		            on: NotFound
		            do: [ ^ false ].

	category keys size = PXEventMultiBundle metaDataFieldNames size 
		ifFalse: [ ^ false ].

	^ PXEventMultiBundle metaDataFieldNames allSatisfy: [ :fieldName | 
		  category keys includes: fieldName ]
]
