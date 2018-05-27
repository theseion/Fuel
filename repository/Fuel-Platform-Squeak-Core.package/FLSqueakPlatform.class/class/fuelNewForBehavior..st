private-extensions-behavior
fuelNewForBehavior: sizeRequested
	<flExtensionOf: #Behavior selector: #fuelNew:>
	"Answer an instance of mine in which serialized references will be injected."

	^ self basicNew: sizeRequested