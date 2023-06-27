running
setUp
	super setUp.
	
	directoryPath := (FileLocator temp / UUID new asString) ensureCreateDirectory pathString