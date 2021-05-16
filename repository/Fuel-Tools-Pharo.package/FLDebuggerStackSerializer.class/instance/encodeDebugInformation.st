private
encodeDebugInformation
	self
		at: #Timestamp putAdditionalObject: self timestampString;
		at: #VM putAdditionalObject: self vmInformationString;
		at: #Image putAdditionalObject: self imageInformationString