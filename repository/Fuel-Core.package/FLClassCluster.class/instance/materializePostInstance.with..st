serialize/materialize
materializePostInstance: aClass with: aDecoder

	| superclass category name format instanceVariableNames layout |
	superclass := aDecoder nextEncodedReference.
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.

	aClass 
		basicSuperclass: superclass;
		setName: name;
		basicCategory: category; 
		methodDictionary: MethodDictionary new.
	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aClass