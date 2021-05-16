baselines-helpers
groupsForPharoCommon: spec
	spec for: #pharo do: [              
		spec
			package: 'Fuel-Preview' with: [ spec requires: #('Fuel-Debug' 'Roassal') ];
			package: 'Fuel-Metalevel' with: [ spec requires: 'Core' ];
			package: 'Fuel-Tools-Pharo' with: [ spec requires: 'Core' ];
			
			package: 'Fuel-Tests-Metalevel' with: [ spec requires: #('Fuel-Metalevel' 'Tests' ) ];
			package: 'Fuel-Tools-Pharo-Tests' with: [ spec requires: #('Fuel-Tools-Pharo') ].
		
		self roassal: spec.

		spec
			group: 'default' with: #('Core' 'Fuel-Tools-Pharo' 'Tests' 'Fuel-Tools-Pharo-Tests');
			group: 'CoreWithExtras' with: #('Core' 'Fuel-Metalevel' 'Fuel-ProgressUpdate');
			group: 'DevelopmentGroup' with: #('CoreWithExtras' 'Fuel-Debug' 'Tests' 'Fuel-Tests-Metalevel') ]