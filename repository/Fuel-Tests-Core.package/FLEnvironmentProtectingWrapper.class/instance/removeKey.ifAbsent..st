classes and traits
removeKey: aKey ifAbsent: aBlock
	^ overlay
		at: aKey
		ifPresent: [
			overlay
				at: aKey
				put: sentinel ]
		ifAbsent: [
			environment
				at: aKey
				ifPresent: [
					overlay
						at: aKey
						put: sentinel ]
				ifAbsent: aBlock ]