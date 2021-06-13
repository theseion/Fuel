instance creation
when: aConditionBlock substituteBy: aValuable
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

	(map
		at: #whenBlocks
		ifAbsentPut: [ Bag new ])
			add: aConditionBlock -> aValuable