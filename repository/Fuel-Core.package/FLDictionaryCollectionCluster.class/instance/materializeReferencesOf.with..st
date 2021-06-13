serialize/materialize
materializeReferencesOf: aDictionary with: aDecoder
	aDecoder nextEncodedByte = true asBit
		ifTrue: [
			self
				materializeKeysAndValuesOf: aDictionary
				from: aDecoder ]
		ifFalse: [
			self
				materializeAssociationsOf: aDictionary
				from: aDecoder ]