running
redefined: aClass with: instanceVariableNames

	^ self classFactory update: aClass to: [ :aBuilder | aBuilder slots: instanceVariableNames ]