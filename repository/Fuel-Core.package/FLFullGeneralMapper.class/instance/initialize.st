initialization
initialize
	super initialize.
	
	internalBehaviors := self configuration internalBehaviors.
	internalMethods := self configuration internalMethods.
	globalSymbols := self configuration globalSymbols.
	environment := self configuration environment