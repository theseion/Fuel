accessing
environment: anObject
	"For tests only, allow overriding the object"
	map
		removeKey: #environment
		ifAbsent:[].
	super environment: anObject