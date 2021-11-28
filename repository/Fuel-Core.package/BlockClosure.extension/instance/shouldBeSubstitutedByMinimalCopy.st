*Fuel-Core
shouldBeSubstitutedByMinimalCopy
	"Clean blocks can be made smaller by replacing the outer context.
	Un unclean closure can't be 'cleaned' so it will just be serialized
	as is. This is an optimization."
	^ self isClean