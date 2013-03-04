private
stackTraceString: err of: aTestCase

	^ (String streamContents: [ :str | err signalerContext errorReportOn: str ]) select: [ :character | self isLegalXMLCharacter: character ].
