initialization
initialize
	super initialize.
	
	internalBehaviors := self configuration behaviorsToSerialize.
	internalMethods := self configuration methodsToSerialize.
	globals := self configuration globals.
	environment := self configuration environment