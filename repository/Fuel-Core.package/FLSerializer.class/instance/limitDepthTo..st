configuring
limitDepthTo: anInteger
	"Fuel will traverse the serialization object graph until it has reached the depth
	specified and ignore any objects above the limit. You can think of the depth as the distance
	between the root object and the one currently being analyzed.
	
	You should be aware that this can have unexpected side effects since it his hard to tell what
	objects will be missing in the resulting object graph.
	
	Graph traversal is depth first."
	
	anInteger isInteger ifFalse: [
		FLConfigurationError signal: 'Depth limit must be an integer' ].

	map
		at: #depthLimit
		put: anInteger