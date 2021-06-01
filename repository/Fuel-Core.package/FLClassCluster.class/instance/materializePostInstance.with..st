serialize/materialize
materializePostInstance: aClass with: aDecoder

	| superclass category name instanceVariableNames layout |
	superclass := aDecoder nextEncodedReference.
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	aDecoder nextEncodedReference. "format"
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.

	aClass 
		basicSuperclass: superclass;
		setName: name;
		basicCategory: category; 
		methodDictionary: MethodDictionary new.
	self
		installLayout: layout
		withVariableNames: instanceVariableNames
		into: aClass