serialize/materialize
serializeGlobalClass: aClass on: anEncoder
	super
		serializeGlobalClass: aClass instanceSide
		on: anEncoder. 
	anEncoder
		encodeByte: (aClass isClassSide
			ifTrue: [ 1 ]
			ifFalse: [ 0 ])