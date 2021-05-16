handling
defaultAction 
	(OupsDebugRequest newForContext: interruptedContext)
		process: Processor activeProcess;
		label: 'External stack';
		submit