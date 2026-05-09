command line
commandSpecification

	<commandline>
	| spec |
	spec := (ClapCommandSpec id: #fuel)
		        description: 'I load .fuel files that are passed as arguments. I materialize/install it''s contents';
		        commandClass: self;
		        addHelp;
		        addPositional: #FILE spec: [ :positional |
					positional
						description: 'The fuel file to load';
						multiple: true ];
		        yourself.

	self 
		addSaveFlagTo: spec;
		addKeepAliveOptionTo: spec.
	^ spec