serialize/materialize
materializePostInstance: aTrait with: aDecoder

	| name environment format layout instanceVariableNames comment stamp packageName packageTagName |
	packageName := aDecoder nextEncodedReference.
	packageTagName := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	environment := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	comment := aDecoder nextEncodedString.
	stamp := aDecoder nextEncodedString.

	aTrait
		initialize;
		setName: name;
		environment: environment.

	self setTag: packageTagName ofPackage: packageName to: aTrait.

	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aTrait.

	aTrait comment: comment stamp: stamp