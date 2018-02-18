baselines-helpers
fuelPlatform: spec		
	spec 
		baseline: 'FuelPlatform' 
		with: [ 
			spec
				repository: 'github://theseion/Fuel:', self versionNumber, '/repository';
  				loads: 'default' ]