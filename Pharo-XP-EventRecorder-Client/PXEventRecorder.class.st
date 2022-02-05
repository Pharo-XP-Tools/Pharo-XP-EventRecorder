"
I extend EREventRecorder with a new configuration delay that I force each time before activating a delivery.
"
Class {
	#name : #PXEventRecorder,
	#superclass : #EREventRecorder,
	#category : #'Pharo-XP-EventRecorder-Client'
}

{ #category : #delivery }
PXEventRecorder >> activateDelivery [
	delivery standardDuration: 1 second.
	^ delivery activate
]

{ #category : #packing }
PXEventRecorder >> eventConsolidatorClass [
	^PXEventConsolidate 
]
