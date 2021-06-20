tests
resultOfSerializeRemoveAndMaterializeAll: objects
	| classesOrTraits materialized |
	classesOrTraits := objects select: [ :anObject | anObject isBehavior or: [anObject isTrait]].
	self serializer fullySerializeAllBehaviors: classesOrTraits.
	self serialize: objects.
	classesOrTraits do: [ :aClassOrTrait | self classFactory deleteBehavior: aClassOrTrait . ].
	materialized := self materialized.
	materialized 
		select: [ :object | object isBehavior ]
		thenDo: [ :behavior | self classFactory registerBehavior: behavior ].
	^ materialized