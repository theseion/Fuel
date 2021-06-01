tests
assertSequencedSerializationEqualityOf: aCollectionToSerialize
			
	| aSerializer fileName aMaterializer materializedCollection |
	fileName := 'sequencedSerializationTest.fuel'.
	aSerializer := FLSerializer newDefault.
	aMaterializer := FLMaterializer newDefault.

	FLPlatform current
		fileNamed: fileName
		writeStreamDo: [:aWriteStream |
			aCollectionToSerialize do: [:anObject |
				 aSerializer serialize: anObject on: aWriteStream ]].
	
	FLPlatform current
		fileNamed: fileName
		readStreamDo: [:aReadStream |
			materializedCollection := OrderedCollection new.
			[aReadStream atEnd] whileFalse: [
				materializedCollection add: 
					(aMaterializer materializeFrom: aReadStream) root ]].
		
	self assert: aCollectionToSerialize = materializedCollection.