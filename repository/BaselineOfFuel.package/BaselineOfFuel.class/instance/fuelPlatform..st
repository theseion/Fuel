baselines-helpers
fuelPlatform: spec		
	spec 
		baseline: 'FuelPlatform' 
		with: [
			| branch |
			branch := Smalltalk os environment
				at: #FL_USE_PLATFORM_MASTER
				ifPresent: [ 'master' ]
				ifAbsent: [ 'v5' ].
			spec
				repository: 'github://theseion/FuelPlatform:' + branch + '/repository';
  				loads: 'default' ]