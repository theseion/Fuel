binding
bindingOf: aString
	^ overlay
		at: aString
		ifPresent: [ :value |
			value == sentinel
				ifTrue: [ ^ nil ]
				ifFalse: [ overlay bindingOf: aString ] ]
		ifAbsent: [ environment bindingOf: aString ]