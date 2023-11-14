*Fuel-Core
instanceVariableNamesDo: anUnaryBlock
	"This is part of the interface between the compiler and a class's instance or field names.
	 The class should enumerate anUnaryBlock with the instance variable name strings.  The order is important. Names evaluated later will override the
	 same names occurring earlier."
	<reflection: 'Class structural inspection - Instance variable inspection'>
	| superInstSize |
	superInstSize := self superclass
		ifNotNil: [ self superclass instSize ]
		ifNil: [ self superclass instanceVariableNamesDo: anUnaryBlock ].
	1 to: self instSize - superInstSize do:
		[ :i| anUnaryBlock value: (self instVarNames at: i) ]