serialize/materialize
afterMaterializationStepWith: aDecoder  
	objects do: [ :anObject |
		variablesMapping materializeTraitVariablesWith: anObject.
		anObject fuelAfterMaterialization ]