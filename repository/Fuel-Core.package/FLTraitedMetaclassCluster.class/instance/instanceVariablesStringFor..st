private
instanceVariablesStringFor: aClass
	^ ' ' join: (aClass classLayout visibleSlots collect: [ :slot |
		slot name ])