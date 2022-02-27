serialize/materialize
materializeTraitVariablesWith: anObject
	"If there are any trait variables, store their values.
	Only at this point do we know that we have trait variables
	because the trait composition is a reference that must be
	fully loaded first.
	
	See FLBehaviorCluster>>installLayout:withFormat:variableNames:into:
	and Behavior>>fuelRecomputeSlotScopeWithTraits."
	FLPlatform current hasStatefulTraits ifFalse: [ ^ self ].
	possibleTraitVariables ifNil: [ ^ self ].
	
	anObject class traitComposition slots do: [ :slot |
		| index |
		index := anObject class instVarIndexFor: slot name.
		index > 0 ifTrue: [
			anObject
				instVarAt: index
				put: (possibleTraitVariables
					at: slot name
					ifAbsent: nil) ] ]