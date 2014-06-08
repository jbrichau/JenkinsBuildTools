private
isLegalXMLCharacter: character

	"
		Some characters can not appear in XML at all (not even in escaped form).
		The set of legal characters is:
			#x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF]
			
		See:
			- http://stackoverflow.com/questions/404107/why-are-control-characters-illegal-in-xml
			- http://www.sklar.com/blog/archives/96-XML-vs.-Control-Characters.html
	"
	
	| codePoint |
	codePoint := character codePoint.
	(codePoint = 16r9) ifTrue: [ ^ true ].
	(codePoint = 16rA) ifTrue: [ ^ true ].
	(codePoint = 16rD) ifTrue: [ ^ true ].
	(codePoint >= 16r20) & (codePoint <= 16rD7FF) ifTrue: [ ^ true ].
	(codePoint >= 16rE000) & (codePoint <= 16rFFFD) ifTrue: [ ^ true ].
	(codePoint >= 16r10000) & (codePoint <= 16r10FFFF) ifTrue: [ ^ true ].
	^ false
