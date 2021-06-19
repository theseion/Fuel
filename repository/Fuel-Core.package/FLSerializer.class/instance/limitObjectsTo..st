configuring
limitObjectsTo: anInteger
	"Fuel will traverse the serialization object graph until it has reached the number of objects
	specified. Depending on the setting of #enableLimitObjectsException Fuel will then either
	signal an exception or continue with writing out the encountered objects.
	
	You should be aware that this can have unexpected side effects since it his hard to tell what
	objects will be missing in the resulting object graph.
	
	Graph traversal is depth first."

	anInteger isInteger ifFalse: [
		FLConfigurationError signal: 'Object limit must be an integer' ].
	
	map
		at: #objectsLimit
		put: anInteger