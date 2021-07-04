baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [              
		spec
			package: 'Fuel-Preview' with: [ spec requires: #('Fuel-Debug' 'Roassal') ].
		
		self roassal: spec.

		spec
			group: 'CoreWithExtras' with: #('Core' 'Fuel-ProgressUpdate' 'Fuel-Debug');
			group: 'DevelopmentGroup' with: #(
				'CoreWithExtras'
				'Tests'
				'Fuel-Tests-ProgressUpdate'
				'Fuel-Tests-Debug');
			group: 'Benchmarks' with: #('Core' 'Fuel-Benchmarks' 'Fuel-Tests-Benchmarks') ]