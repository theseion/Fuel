serialize/materialize layouts
installLayout: aLayout withFormat: anInteger variableNames: variableNames into: aClassOrTrait
	| scope superSlotSize slots |	
	aLayout hasSlotScope ifTrue: [
		superSlotSize := self superclassSlotSizeOf: aClassOrTrait.
		slots := variableNames withIndexCollect: [ :var :index |
			(InstanceVariableSlot named: var asSymbol)
				index: index + superSlotSize;
				yourself ].
		scope := (self superclassLayoutOf: aClassOrTrait) slotScope extend: slots.
		aLayout slotScope: scope ].
	
	aLayout host: aClassOrTrait.
	"NOTE: the class format may change later when we materialize trait variables.
		However, it is important to set the format correctly (or possibly too large) here,
		even though it may indicate more instance variables than the layout defines.
		If we don't do this, it will not be possible to store the additional variables from
		traits in the instances because the instances will not have been allocated with
		enough fields.
		See Behavior>>fuelRecomputeSlotScopeWithTraits
		and FLVariablesMapping>>materializeTraitVariables."
	aClassOrTrait
		classLayout: aLayout;
		"We have to make sure that instances are allocated with enough space
		when instance variables have been added in the target environment."
		setFormat: (anInteger max: aLayout format)