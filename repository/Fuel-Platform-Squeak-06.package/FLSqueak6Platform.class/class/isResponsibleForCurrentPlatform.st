testing
isResponsibleForCurrentPlatform
	^ super isResponsibleForCurrentPlatform and: [
		(SystemVersion current version beginsWith: 'Squeak6') or: [
			(SystemVersion current version beginsWith: 'Squeak5') and: [
				SystemVersion current version includesSubstring: 'alpha' ] ] ]