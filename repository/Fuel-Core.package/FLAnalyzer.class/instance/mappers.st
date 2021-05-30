protected
mappers

	^ OrderedCollection new
		addAll: self pluggableSubstitutionMappers;
		addAll: self globalMappers;
		addAll: self generalMappers;
		reduceRight: [:left :right | left next: right ];
		yourself