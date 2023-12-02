tests
testSupportForWeakKeyAssociation
	| ephemeron errorString |
	ephemeron := WeakKeyAssociation new.
	errorString := 'Unsupported use of ephemeron'.
	self
		should: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable
		whoseDescriptionIncludes: errorString
		description: 'WeakKeyAssociation with nil container is not supported'.
	
	ephemeron
		key: 'key'
		value: 'value'.
	self
		should: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable
		whoseDescriptionIncludes: errorString
		description: 'WeakKeyAssociation with nil container is not supported'.
		
	ephemeron container: Set new.
	self
		should: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable
		whoseDescriptionIncludes: errorString
		description: 'WeakKeyAssociation is only supported with dictionary containers'.
		
	ephemeron container: Dictionary new.
	self
		shouldnt: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable.
		
	ephemeron container: WeakKeyDictionary new.
	self
		shouldnt: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable