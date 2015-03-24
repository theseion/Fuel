"fix Installer for Smalltalkhub"
(Smalltalk hasClassNamed: #InstallerInternetBased) ifTrue: [
	Utilities setAuthorInitials: 'foo'.
	(Smalltalk classNamed: #InstallerInternetBased) compile: 'urlGet: aUrl

	| page |
	page := HTTPSocket httpGet: aUrl accept: ''application/x-monticello''.  
	(page respondsTo: #reset)  ifFalse: [ ^ nil ].
	(self isHtmlStream: page) ifTrue: [ page := self extractFromHtml: page option: nil ].
	^ page reset
	' ].
	