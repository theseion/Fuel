baselines
baseline: spec

	<baseline>
	spec for: #common do: [
		spec
			package: 'Fuel-Core';
			package: 'Fuel-Tests-Core' with: [ spec requires: 'Core' ].

		spec
			group: 'Core' with: #( 'Fuel-Core' );
			group: 'Tests' with: #( 'Core' 'Fuel-Tests-Core' ) ]