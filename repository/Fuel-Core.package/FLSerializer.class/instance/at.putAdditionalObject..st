configuring-materialization
at: aKey putAdditionalObject: anObject 
	"This is useful if we want to attach objects to a package that will also be serialized. The way they are stored is key-value."
	(map
		at: #additionalObjects
		ifAbsentPut: [ IdentityDictionary new ])
			at: aKey
			put: anObject