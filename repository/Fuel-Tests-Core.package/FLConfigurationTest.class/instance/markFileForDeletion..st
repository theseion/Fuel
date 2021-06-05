helpers
markFileForDeletion: aFile
	filesMarkedForDeletion ifNil: [ filesMarkedForDeletion := Set new ].
	filesMarkedForDeletion add: aFile asFileReference