sample creation
sampleNamed: aSelector problemSize: n

	^ (self new
			selector: aSelector;
			problemSize: n;
			yourself) asSample