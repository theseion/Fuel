serializing
run
	"Serialize the graph starting at the root object."

	self
		analysisStep;
		prepareObjectsStep;
		headerStep;
		instancesStep;
		referencesStep;
		trailerStep