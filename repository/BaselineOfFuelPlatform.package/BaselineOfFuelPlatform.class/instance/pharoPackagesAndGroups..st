helpers
pharoPackagesAndGroups: spec
	spec for: #pharo do: [
		spec package: 'Fuel-Platform-Pharo-Core' with: [ spec requires: 'Fuel-Platform-Core' ] ].
	spec for: #'pharo1.x' do: [
		spec package: 'Fuel-Platform-Pharo-01x' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-01x' ].
	spec for: #'pharo2.x' do: [
		spec package: 'Fuel-Platform-Pharo-02' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-02' ].
	spec for: #'pharo3.x' do: [
		spec package: 'Fuel-Platform-Pharo-03' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-03' ].
	spec for: #'pharo4.x' do: [
		spec package: 'Fuel-Platform-Pharo-04' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-04' ].
	spec for: #'pharo5.x' do: [
		spec package: 'Fuel-Platform-Pharo-05' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-05' ].
	spec for: #'pharo6.x' do: [
		spec package: 'Fuel-Platform-Pharo-06' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-06' ].
	spec for: #'pharo7.x' do: [
		spec package: 'Fuel-Platform-Pharo-07' with: [ spec requires: 'Fuel-Platform-Pharo-Core' ].
		spec group: 'FuelPlatformCurrentGroup' with: 'Fuel-Platform-Pharo-07' ]