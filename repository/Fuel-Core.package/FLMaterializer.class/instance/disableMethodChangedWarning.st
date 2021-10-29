configuring
disableMethodChangedWarning
	"Setting this to true will prevent Fuel from signalling FLMethodChanged exceptions
	when the method of a block has changed upon materialization."

	map
		at: #methodChangedWarningDisabled
		put: true