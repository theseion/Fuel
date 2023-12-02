analyzing
referencesOf: aDictionary do: aBlock	
	(self hasRealAssociations: aDictionary)
		ifTrue: [
			aDictionary keysAndValuesDo: [ :key :value |
				aBlock
					value: key;
					value: value ] ]
		ifFalse: [
			self
				specialAssociationsOf: aDictionary
				do: aBlock ]