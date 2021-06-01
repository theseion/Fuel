analyzing
referencesOf: aClassVariable do: aBlock
	aBlock 
		value: aClassVariable owningClass;
		value: aClassVariable key