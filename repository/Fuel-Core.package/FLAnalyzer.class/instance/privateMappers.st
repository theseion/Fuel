protected
privateMappers

	^ OrderedCollection new
		addAll: self globalMappers;
		addAll: self generalMappers;
		reduceRight: [:left :right | left next: right ];
		yourself