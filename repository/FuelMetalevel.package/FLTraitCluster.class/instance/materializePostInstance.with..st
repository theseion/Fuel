serialize/materialize
materializePostInstance: aTrait with: aDecoder

	| classTrait category name environment |
	classTrait := aDecoder nextEncodedReference.
	category := aDecoder nextEncodedReference.
	name := aDecoder nextEncodedReference.
	environment := aDecoder nextEncodedReference.
	
	aTrait 
		initialize;
		name: name;
		basicCategory: (category ifNil: [ RPackage defaultPackageName ]) asSymbol; 
			"MartinDias-2014-09-03: initialization demanded by esteban for fixing ImageWorker"
		classTrait: classTrait;
		environment: environment.
	
	classTrait baseTrait: aTrait.