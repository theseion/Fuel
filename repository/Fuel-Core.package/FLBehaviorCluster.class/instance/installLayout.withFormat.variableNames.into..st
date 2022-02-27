serialize/materialize layouts
installLayout: aLayout withFormat: anInteger variableNames: variableNames into: aClass
	| scope superSlotSize slots |	
	aLayout hasSlotScope ifTrue: [
		superSlotSize := aClass superclass allInstVarNames size.
		slots := variableNames withIndexCollect: [ :var :index |
			(InstanceVariableSlot named: var asSymbol)
				index: index + superSlotSize;
				yourself ].
		scope := aClass superclass classLayout slotScope extend: slots.
		aLayout slotScope: scope ].
	
	aLayout host: aClass.
	"NOTE: the class format may change later when we materialize trait variables.
		However, it is important to set the format correctly (or possibly too large) here,
		even though it may indicate more instance variables than the layout defines.
		If we don't do this, it will not be possible to store the additional variables from
		traits in the instances because the instances will not have been allocated with
		enough fields.
		See Behavior>>fuelRecomputeSlotScopeWithTraits
		and FLVariablesMapping>>materializeTraitVariables."
	aClass
		classLayout: aLayout;
		setFormat: anInteger