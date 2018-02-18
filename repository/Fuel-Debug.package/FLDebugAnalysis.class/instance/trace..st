tracing
trace: anObject

	references add: (Association key: currentlyTracing value: anObject).
	super trace: anObject.
	
	