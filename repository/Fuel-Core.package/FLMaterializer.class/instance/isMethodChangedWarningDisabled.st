testing
isMethodChangedWarningDisabled
	^ map
		at: #methodChangedWarningDisabled
		ifAbsent: [ self class defaultMethodChangedWarningDisabled ]