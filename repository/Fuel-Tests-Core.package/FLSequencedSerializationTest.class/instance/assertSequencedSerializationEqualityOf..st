tests
assertSequencedSerializationEqualityOf: aCollectionToSerialize	
	| materializedCollection |
	self serializer
		objectCollection: aCollectionToSerialize;
		serialize.
	
	materializedCollection := self materializer materializeObjectCollection.
		
	self assertCollection: aCollectionToSerialize hasSameElements: materializedCollection