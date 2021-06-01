cleaning
deleteBehavior: aBehavior
	self createdClasses
		remove: aBehavior
		ifAbsent: [].
	self createdTraits
		remove: aBehavior
		ifAbsent: [].
	self removeFromSystem: aBehavior