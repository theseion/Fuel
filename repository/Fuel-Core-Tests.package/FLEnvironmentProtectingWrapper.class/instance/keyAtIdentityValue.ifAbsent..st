accessing
keyAtIdentityValue: anObject ifAbsent: aBlock
	^ overlay
		keyAtIdentityValue: anObject
		ifAbsent: [
			environment
				keyAtIdentityValue: anObject
				ifAbsent: aBlock ]