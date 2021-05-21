baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [              
		spec
			package: 'Fuel-Preview' with: [ spec requires: #('Fuel-Debug' 'Roassal') ];
			package: 'Fuel-Metalevel' with: [ spec requires: 'Core' ];
			
			package: 'Fuel-Tests-Metalevel' with: [ spec requires: #('Fuel-Metalevel' 'Tests' ) ].
		
		self roassal: spec.

		spec
			group: 'CoreWithExtras' with: #('Core' 'Fuel-Metalevel' 'Fuel-ProgressUpdate');
			group: 'DevelopmentGroup' with: #('CoreWithExtras' 'Fuel-Debug' 'Tests' 'Fuel-Tests-Metalevel');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks') ]