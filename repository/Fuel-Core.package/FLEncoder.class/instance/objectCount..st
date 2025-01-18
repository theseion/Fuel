accessing
objectCount: aNumber
	objectCount := aNumber.
	objectsIndexes := IdentityDictionary new.
	substitutionIndexes := IdentityDictionary new.
	indexStream := FLIndexStream on: stream digits: aNumber bytesCount