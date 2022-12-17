baselines-helpers
fuelPlatform: spec		
	spec 
		baseline: 'FuelPlatform' 
		with: [
			| branch |
			branch := Smalltalk
				at: #SmalltalkCI
				ifPresent: [ :class |
					(class getEnv: #FL_USE_PLATFORM_MASTER)
						ifNotNil: [ 'master' ]
						ifNil: [ 'v5' ] ]
				ifAbsent: [ 'v5' ].
			spec
				repository: 'github://theseion/FuelPlatform:', branch, '/repository';
  				loads: 'default' ]