testing
shouldMaterializeHeaderOnly
	^ map
		at: #shouldMaterializeHeaderOnly
		ifAbsent: [ self class defaultShouldMaterializeHeaderOnly ]