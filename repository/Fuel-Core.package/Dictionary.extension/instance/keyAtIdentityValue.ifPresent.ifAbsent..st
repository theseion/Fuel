*Fuel-Core
keyAtIdentityValue: anObject ifPresent: presentBlock ifAbsent: absentBlock
	| value |
	value := self
		keyAtIdentityValue: anObject
		ifAbsent: [ ^ absentBlock value ].
	
	^ presentBlock cull: value