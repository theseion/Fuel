private
copyRecreating: sourceDictionary

	| copy |
	copy := sourceDictionary class new: sourceDictionary size.
	
	sourceDictionary associationsDo: [:assoc | 
		copy at: assoc key put: assoc value ].
