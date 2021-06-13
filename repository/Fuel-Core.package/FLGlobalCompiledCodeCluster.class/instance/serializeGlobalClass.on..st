serialize/materialize
serializeGlobalClass: aClass on: anEncoder
	super
		serializeGlobalClass: aClass instanceSide
		on: anEncoder. 
	anEncoder encodeByte: aClass isClassSide asBit