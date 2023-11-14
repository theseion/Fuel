serialize/materialize
materializePostInstance: aClass with: aDecoder

	| superclass name format instanceVariableNames layout comment stamp packageName packageTagName |
	superclass := aDecoder nextEncodedReference.
	packageName := aDecoder nextEncodedReference.
	packageTagName := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	comment := aDecoder nextEncodedString.
	stamp := aDecoder nextEncodedString.

	aClass
		basicSuperclass: superclass;
		setName: name;
		methodDictionary: MethodDictionary new.

	self setTag: packageTagName ofPackage: packageName to: aClass.

	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aClass.

	aClass comment: comment stamp: stamp