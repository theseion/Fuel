analyzing
referencesOf: aDictionary do: aBlock	
	"In Pharo 9 the class pool is a dictionary containing ClassVariables
	pretending to be Associations. For that case we need to skip the optimization."
	(self hasRealAssociations: aDictionary)
		ifTrue: [
			aDictionary keysAndValuesDo: [ :key :value |
				aBlock
					value: key;
					value: value ] ]
		ifFalse: [ aDictionary associationsDo: aBlock ]