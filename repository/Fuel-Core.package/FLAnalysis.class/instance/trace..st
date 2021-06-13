tracing
trace: anObject
	"It's possible to get here from #privateMapAndTrace: but then #mapAndTrace: will
	not be sent again (see #run)"
	objectStack
		ifNil: [ self privateTrace: anObject ]
		ifNotNil: [ objectStack push: anObject ]