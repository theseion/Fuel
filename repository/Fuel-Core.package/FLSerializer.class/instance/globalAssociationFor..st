private
globalAssociationFor: anObject
	"Some globals, like ActiveHand have a nil value in the Smalltalk globals. Therefore, we cannot map nil to globalCluster. We could filter before in #defaultGlobalSymbols but that means that not even the Association will be consider global."
	(self environment
		at: anObject
		ifPresent: [ :value |
			^ anObject -> (value ifNil: [ anObject ]) ]
		ifAbsent: [
			self environment
				keyAtIdentityValue: anObject
				ifPresent: [ :key |
					^ key -> anObject ]
				ifAbsent: [
					FLConfigurationError signal: 'No such global found in environment: ', anObject asString ] ])