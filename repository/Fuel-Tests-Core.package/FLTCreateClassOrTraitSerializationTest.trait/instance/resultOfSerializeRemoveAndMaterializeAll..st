tests
resultOfSerializeRemoveAndMaterializeAll: objects
	| classesOrTraits materialized |
	classesOrTraits := objects select: [ :anObject | anObject isBehavior or: [anObject isTrait]].
	self analyzer considerInternalAllBehaviors: classesOrTraits.
	self serialize: objects.
	classesOrTraits do: [ :aClassOrTrait | self removeFromSystem: aClassOrTrait . ].
	materialized := self materialized.
	materialized 
		select: [ :object | object isBehavior ]
		thenDo: [ :behavior | self registerBehavior: behavior ].
	^ materialized