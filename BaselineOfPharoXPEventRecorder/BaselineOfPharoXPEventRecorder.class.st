Class {
	#name : #BaselineOfPharoXPEventRecorder,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoXPEventRecorder
}

{ #category : #baselines }
BaselineOfPharoXPEventRecorder >> baseline: spec [

	<baseline>
	spec
		baseline: 'EventRecorder'
		with: [ spec repository: 'github://Pharo-XP-Tools/EventRecorder:main/' ].

	spec for: #common do: [ 
		spec package: 'Pharo-XP-EventRecorder-Client'.
		spec
			package: 'Pharo-XP-EventRecorder-Server'
			with: [ spec requires: #( 'Pharo-XP-EventRecorder-Client' ) ].
		spec
			package: 'Pharo-XP-EventRecorder-Client-Tests'
			with: [ spec requires: #( 'Pharo-XP-EventRecorder-Client' ) ].
		spec
			package: 'Pharo-XP-EventRecorder-Server-Tests'
			with: [ spec requires: #( 'Pharo-XP-EventRecorder-Server' ) ] ]
]
