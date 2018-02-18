baselines
baseline: spec
  <baseline>
  spec
	for: #common
	do: [
		spec postLoadDoIt: #addPostloadHacks.

		self   
			fuelPlatform: spec;
			smark: spec.

		spec
			package: 'Fuel' with: [ spec requires: 'FuelPlatform' ];
			package: 'Fuel-Tests' with: [ spec requires: 'Fuel' ];
			package: 'Fuel-Debug' with: [ spec requires: 'Fuel' ];
			package: 'Fuel-ProgressUpdate' with: [ spec requires: #('Fuel' 'Tests') ];
			package: 'Fuel-Benchmarks' with: [ spec requires: #('Fuel' 'Tests' 'SMark-Jenkins') ].
					
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Fuel');
			group: 'CoreWithExtras' with: #('Core' 'Fuel-ProgressUpdate');
			group: 'Tests' with: #('Core' 'Fuel-Tests');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks').
	].

	self groupsForPharoCommon: spec