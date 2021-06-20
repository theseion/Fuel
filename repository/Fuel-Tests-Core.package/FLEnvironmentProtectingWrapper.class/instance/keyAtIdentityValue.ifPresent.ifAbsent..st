accessing
keyAtIdentityValue: anObject ifPresent: presentBlock ifAbsent: absentBlock
	^ overlay
		keyAtIdentityValue: anObject
		ifPresent: presentBlock
		ifAbsent: [
			environment
				keyAtIdentityValue: anObject
				ifPresent: presentBlock
				ifAbsent: absentBlock ]