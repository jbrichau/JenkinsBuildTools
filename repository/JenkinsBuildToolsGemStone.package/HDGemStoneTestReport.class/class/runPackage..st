running
runPackage: aString
	
	|classes |
	classes := (PackageOrganizer default packageNamed:aString ifAbsent:[]) classes.
	^ self runClasses: classes named: aString