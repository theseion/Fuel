serialize/materialize
materializeReferencesOf: anObject with: aDecoder 
	mapping withIndexDo: [ :index :varIndex | 
			| reference |
			reference := aDecoder nextEncodedReference.
			index
				ifNotNil: [
					anObject 
						instVarAt: index
						put: reference ]
				ifNil: [
					"Since the variables from traits will only become known
					after the references have been fully materialized we
					don't yet know whether this variable is to be ignored
					or might be needed later"
					possibleTraitVariables
						at: (notIgnoredVariables at: varIndex)
						put: reference ] ]