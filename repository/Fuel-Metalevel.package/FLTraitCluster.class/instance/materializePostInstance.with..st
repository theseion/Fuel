serialize/materialize
materializePostInstance: aTrait with: aDecoder
	| category name environment |
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	environment := aDecoder nextEncodedReference.
	
	aTrait 
		initialize;
		name: name;
		basicCategory: (category ifNil: [ RPackage defaultPackageName ]) asSymbol;
		environment: environment