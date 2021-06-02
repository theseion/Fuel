serialize/materialize
materializeReferencesOf: aDictionary with: aDecoder
	aDecoder nextEncodedByte = 1
		ifTrue: [
			self
				materializeKeysAndValuesOf: aDictionary
				from: aDecoder ]
		ifFalse: [
			self
				materializeAssociationsOf: aDictionary
				from: aDecoder ]