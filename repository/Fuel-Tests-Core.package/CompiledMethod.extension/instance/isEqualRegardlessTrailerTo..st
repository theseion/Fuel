*Fuel-Tests-Core
isEqualRegardlessTrailerTo: aCompiledMethod
	^ (self copyWithTrailerBytes: CompiledMethodTrailer empty) = (aCompiledMethod copyWithTrailerBytes: CompiledMethodTrailer empty)