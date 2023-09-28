serialize/materialize
materializePostInstance: aTrait with: aDecoder
	| category name environment format layout instanceVariableNames comment stamp |
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	environment := aDecoder nextEncodedReference.
	format := aDecoder nextEncodedReference.
	layout := self materializeLayoutWith: aDecoder.
	instanceVariableNames := aDecoder nextEncodedString substrings: ' '.
	comment := aDecoder nextEncodedString.
	stamp := aDecoder nextEncodedString.
	
	aTrait 
		initialize;
		"#initialize sets Object as the superclass
		but the superclass of traits is nil"
		superclass: nil;
		setName: name;
		basicCategory: (category ifNil: [ UndefinedPackage undefinedPackageName ]) asSymbol;
		environment: environment.
	self
		installLayout: layout
		withFormat: format
		variableNames: instanceVariableNames
		into: aTrait.
		
	aTrait
		comment: comment
		stamp: stamp