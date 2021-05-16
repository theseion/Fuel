private
fileNameForContext: aContext
	| date |
	date := DateAndTime now.
	^ String streamContents: [ :s | 
		s << 'Debugger-Stack-'.
		s << aContext receiver class instanceSide name.
		s << '-'.
		date printYMDOn: s.
		s << '-'.
		s print: date hour24.
		s print: date minute.
		s print: date second.
		s << '.fuel' ]