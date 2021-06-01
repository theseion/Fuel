serialize/materialize layouts
installLayout: aLayout withVariableNames: variableNames into: aClass
	| scope superSlotSize slots |
	aLayout hasSlotScope ifTrue: [
		superSlotSize := aClass superclass allInstVarNames size.
		slots := variableNames withIndexCollect: [ :var :index |
			(InstanceVariableSlot named: var asSymbol)
				index: index + superSlotSize;
				yourself ].
		scope := aClass superclass classLayout slotScope extend: slots.
		aLayout slotScope: scope ].
	aClass
		classLayout: aLayout;
		setFormat: aLayout format