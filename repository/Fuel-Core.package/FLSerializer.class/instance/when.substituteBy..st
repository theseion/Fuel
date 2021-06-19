configuring
when: aConditionBlock substituteBy: aSubstitutionBlock
	"Dynamically substitute any object in the object graph with aValuable (understands #value and #value:)
	if conditionBlock answers true.
	Every object in the graph will be passed as an argument to aConditionBlock and to aValuable if
	aCondition Block answers true.
	Note that this may reduce performance significantly compared to static substitution (i.e. using methods
	on the classes of the objects to replace, e.g. #fuelReplacement).
	Example:
		configuration
			when: [ :object | object isString ]
			substituteBy: [ :object | nil ]"
	aConditionBlock isBlock ifFalse: [
		FLConfigurationError signal: 'Condition must be a block' ].
	aConditionBlock numArgs = 1 ifFalse: [
		FLConfigurationError signal: 'Condition block must accept the currently analysed object as single argument' ].
	aSubstitutionBlock isBlock ifFalse: [
		FLConfigurationError signal: 'Substitution must be a block' ].
	aSubstitutionBlock numArgs = 1 ifFalse: [
		FLConfigurationError signal: 'Substitution block must accept the currently analysed object as single argument' ].

	(map
		at: #substitutions
		ifAbsentPut: [ Bag new ])
			add: aConditionBlock -> aSubstitutionBlock