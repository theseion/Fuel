serialize/materialize
registerIndexesOn: aDictionary
	"Since the introduction of slots we need the superclass of materialized
	class to be fully materialized already when we materialize the slots.
	To ensure this we order classes here by the number of their superclasses.
	See #testCreateHierarchyWithSubclassSerializedBeforeSuperclass"
	objects := objects sorted: [ :a :b |
		a allSuperclasses size <= b allSuperclasses size ].
	
	super registerIndexesOn: aDictionary