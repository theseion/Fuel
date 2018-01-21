I am an analysis which facilitates debugging. 

To use, send #setDebug to an analyzer. Example:

(FLAnalyzer newDefault 
	setDebug;
	analysisFor: #(5 #(7 #(11))))
	pathsTo: 11.

will answer paths to 11.

It's very recommended to use FuelPreview package for visualizing such paths.