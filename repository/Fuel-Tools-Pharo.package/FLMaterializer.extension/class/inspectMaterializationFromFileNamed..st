*Fuel-Tools-Pharo-FileRegistry
inspectMaterializationFromFileNamed: aString

	| result |
	result := self materializeFromFileNamed: aString.
	^ result inspect