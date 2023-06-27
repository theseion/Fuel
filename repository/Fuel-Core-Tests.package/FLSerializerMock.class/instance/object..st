accessing
object: anObject
	"For tests only, allow overriding the object"
	map
		removeKey: #object
		ifAbsent: [].
	super object: anObject