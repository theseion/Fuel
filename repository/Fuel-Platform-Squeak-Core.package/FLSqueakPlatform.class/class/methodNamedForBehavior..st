private-extensions-behavior
methodNamedForBehavior: aSelector
	<flExtensionOf: #Behavior selector: #methodNamed:>
	^ self methodDict at: aSelector