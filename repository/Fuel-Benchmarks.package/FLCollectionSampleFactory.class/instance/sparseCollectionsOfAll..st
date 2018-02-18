private
sparseCollectionsOfAll: anArrayOfCollectionClasses
	
	^ (1 to: self problemSize / 10) 
		collect: [ :i | (anArrayOfCollectionClasses atWrap: i) sparseSample ]