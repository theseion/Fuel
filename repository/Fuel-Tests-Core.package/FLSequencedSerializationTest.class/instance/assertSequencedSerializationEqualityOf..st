tests
assertSequencedSerializationEqualityOf: aCollectionToSerialize	
	| materializedCollection |
	self serializer
		objectCollection: aCollectionToSerialize;
		serialize.
	
	materializedCollection := self materializer materializeObjectCollection roots.
		
	self assertCollection: aCollectionToSerialize hasSameElements: materializedCollection