serialize/materialize
materializePostInstance: aTrait with: aDecoder
	| category name environment format layout instanceVariableNames |
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	environment := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	
	aTrait 
		initialize;
		"#initialize sets Object as the superclass
		but the superclass of traits is nil"
		superclass: nil;
		setName: name;
		basicCategory: (category ifNil: [ RPackage defaultPackageName ]) asSymbol;
		environment: environment.
	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aTrait