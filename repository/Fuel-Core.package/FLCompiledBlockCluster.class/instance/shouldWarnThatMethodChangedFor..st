serialize/materialize
shouldWarnThatMethodChangedFor: aBlock
	| method currentMethod |
	method := aBlock method.
	(method methodClass includesSelector: method selector) ifFalse: [ ^ true ].
	
	currentMethod := method methodClass compiledMethodAt: method selector.
	^ currentMethod recursiveBytecodesHash ~= method recursiveBytecodesHash or: [
		currentMethod literals ~= method literals ]