tests
resultOfSerializeRemoveAndMaterializeAll: objects

	| classesOrTraits materialized silent |
	silent := OrderedCollection new.
	classesOrTraits := objects select: [ :anObject | anObject isBehavior or: [ anObject isTrait ] ].
	self serializer fullySerializeAllBehaviors: classesOrTraits.
	self serialize: objects.
	classesOrTraits do: [ :aClassOrTrait |
		(self classFactory createdSilently includes: aClassOrTrait) ifTrue: [ silent add: aClassOrTrait name ].
		self classFactory delete: aClassOrTrait ].
	materialized := self materialized.
	materialized
		select: [ :object | object isBehavior ]
		thenDo: [ :behavior |
			self classFactory registerBehavior: behavior.
			(silent includes: behavior name) ifTrue: [ self classFactory createdSilently add: behavior ] ].
	^ materialized