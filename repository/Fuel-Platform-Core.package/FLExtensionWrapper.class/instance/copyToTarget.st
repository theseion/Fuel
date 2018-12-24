private
copyToTarget
	FLPlatform current
		addAndClassifySelector: self selector
		inClass: self targetClass
		withMethod: self method copy
		inProtocol: self extensionProtocolName