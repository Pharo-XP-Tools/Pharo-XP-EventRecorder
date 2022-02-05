Class {
	#name : #PXEventConsolidate,
	#superclass : #EREventConsolidate,
	#category : #'Pharo-XP-EventRecorder-Client'
}

{ #category : #'accessing - computed' }
PXEventConsolidate >> consolidated [

	| consolidatedCollectors |
	consolidatedCollectors := OrderedDictionary new.
	collectors do: [ :eachCollector | 
		| aCollector |
		aCollector := consolidatedCollectors
			              at: eachCollector url printString asSymbol
			              ifAbsentPut: [ eachCollector ].
		aCollector == eachCollector ifFalse: [ 
			eachCollector bundle do: [ :eachEvent | aCollector add: eachEvent ] ] ].
	^ consolidatedCollectors asArray
]
