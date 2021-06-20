configuring-globals
lookUpInGlobals: anObject
	(map
		at: #globals
		ifAbsentPut: [ IdentitySet new ])
			add: anObject