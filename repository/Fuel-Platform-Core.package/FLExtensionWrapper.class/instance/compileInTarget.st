private
compileInTarget
	| source |
	source := self method methodClass instanceSide
		perform: self method selector
		withArguments: (1 to: self method selector numArgs) asArray.
	self targetClass compile: source.
	self targetClass organization
		classify: self selector
		under: self extensionProtocolName